package cluster_policy_controller

import (
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"path"

	configv1 "github.com/openshift/api/config/v1"
	openshiftcontrolplanev1 "github.com/openshift/api/openshiftcontrolplane/v1"
	"github.com/openshift/library-go/pkg/config/helpers"
	"github.com/openshift/library-go/pkg/serviceability"
	"github.com/spf13/cobra"
	kerrors "k8s.io/apimachinery/pkg/api/errors"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/runtime/serializer"
	utilruntime "k8s.io/apimachinery/pkg/util/runtime"
	"k8s.io/client-go/tools/clientcmd/api"
	"k8s.io/klog/v2"
)

const RecommendedStartControllerName = "cluster-policy-controller"

type ClusterPolicyController struct {
	ConfigFilePath string
	// KubeConfigFile points to a kubeconfig file if you don't want to use the in cluster config
	KubeConfigFile string
	// TODO: remove - dummy variable to support config format update
	Namespace string

	Output io.Writer
}

func NewClusterPolicyControllerCommand(name string, out, errout io.Writer, stopCh <-chan struct{}) *cobra.Command {
	options := &ClusterPolicyController{Output: out}

	cmd := &cobra.Command{
		Use:   name,
		Short: "Start the cluster policy controller",
		Run: func(c *cobra.Command, args []string) {
			serviceability.StartProfiler()

			if err := options.RunPolicyController(stopCh); err != nil {
				if kerrors.IsInvalid(err) {
					if details := err.(*kerrors.StatusError).ErrStatus.Details; details != nil {
						fmt.Fprintf(errout, "Invalid %s %s\n", details.Kind, details.Name)
						for _, cause := range details.Causes {
							fmt.Fprintf(errout, "  %s: %s\n", cause.Field, cause.Message)
						}
						os.Exit(255)
					}
				}
				klog.Fatal(err)
			}
		},
	}

	flags := cmd.Flags()
	// This command only supports reading from config
	flags.StringVar(&options.ConfigFilePath, "config", options.ConfigFilePath, "Location of the master configuration file to run from.")
	cmd.MarkFlagFilename("config", "yaml", "yml")
	flags.StringVar(&options.KubeConfigFile, "kubeconfig", options.KubeConfigFile, "Location of the master configuration file to run from.")
	cmd.MarkFlagFilename("kubeconfig", "kubeconfig")
	// TODO: remove - dummy variable to support config format update
	flags.StringVar(&options.Namespace, "namespace", options.Namespace, "To be removed")

	return cmd
}

// RunPolicyController takes the options and starts the controller.  blocks until the process is finished or the leader lease is lost
func (o *ClusterPolicyController) RunPolicyController(stopCh <-chan struct{}) error {

	config := &openshiftcontrolplanev1.OpenShiftControllerManagerConfig{
		/// this isn't allowed to be nil when by itself.
		ServingInfo: &configv1.HTTPServingInfo{},
	}

	if len(o.ConfigFilePath) != 0 {
		// try to decode into our new types first.  right now there is no validation, no file path resolution.  this unsticks the operator to start.
		// TODO add those things
		configContent, err := ioutil.ReadFile(o.ConfigFilePath)
		if err != nil {
			return err
		}
		scheme := runtime.NewScheme()
		utilruntime.Must(openshiftcontrolplanev1.Install(scheme))
		codecs := serializer.NewCodecFactory(scheme)
		obj, err := runtime.Decode(codecs.UniversalDecoder(openshiftcontrolplanev1.GroupVersion, configv1.GroupVersion), configContent)
		if err != nil {
			return err
		}

		// Resolve relative to CWD
		absoluteConfigFile, err := api.MakeAbs(o.ConfigFilePath, "")
		if err != nil {
			return err
		}
		configFileLocation := path.Dir(absoluteConfigFile)

		config = obj.(*openshiftcontrolplanev1.OpenShiftControllerManagerConfig)
		/// this isn't allowed to be nil when by itself.
		// TODO remove this when the old path is gone.
		if config.ServingInfo == nil {
			config.ServingInfo = &configv1.HTTPServingInfo{}
		}
		if err := helpers.ResolvePaths(getOpenShiftControllerConfigFileReferences(config), configFileLocation); err != nil {
			return err
		}
	}

	setRecommendedOpenShiftControllerConfigDefaults(config)

	clientConfig, err := helpers.GetKubeConfigOrInClusterConfig(config.KubeClientConfig.KubeConfig, config.KubeClientConfig.ConnectionOverrides)
	if err != nil {
		return err
	}
	return RunClusterPolicyController(config, clientConfig, stopCh)
}

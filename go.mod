module github.com/openshift/cluster-kube-controller-manager-operator

go 1.12

require (
	github.com/NYTimes/gziphandler v0.0.0-20170623195520-56545f4a5d46
	github.com/PuerkitoBio/purell v1.0.0
	github.com/PuerkitoBio/urlesc v0.0.0-20160726150825-5bd2802263f2
	github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973
	github.com/blang/semver v3.5.0+incompatible
	github.com/certifi/gocertifi v0.0.0-20180905225744-ee1a9a0726d2
	github.com/coreos/etcd v3.3.15+incompatible
	github.com/coreos/go-systemd v0.0.0-20180511133405-39ca1b05acc7
	github.com/coreos/pkg v0.0.0-20180108230652-97fdf19511ea
	github.com/davecgh/go-spew v0.0.0-20170626231645-782f4967f2dc
	github.com/emicklei/go-restful v0.0.0-20170410110728-ff4f55a20633
	github.com/evanphx/json-patch v4.2.0+incompatible
	github.com/getsentry/raven-go v0.0.0-20190513200303-c977f96e1095
	github.com/ghodss/yaml v0.0.0-20150909031657-73d445a93680
	github.com/go-openapi/jsonpointer v0.0.0-20160704185906-46af16f9f7b1
	github.com/go-openapi/jsonreference v0.0.0-20160704190145-13c6e3589ad9
	github.com/go-openapi/spec v0.0.0-20160808142527-6aced65f8501
	github.com/go-openapi/swag v0.0.0-20160704191624-1d0bd113de87
	github.com/gogo/protobuf v0.0.0-20190723190241-65acae22fc9d
	github.com/golang/groupcache v0.0.0-20160516000752-02826c3e7903
	github.com/golang/protobuf v1.3.1
	github.com/gonum/blas v0.0.0-20170728112917-37e82626499e
	github.com/gonum/floats v0.0.0-20170731225635-f74b330d45c5
	github.com/gonum/graph v0.0.0-20170401004347-50b27dea7ebb
	github.com/gonum/internal v0.0.0-20170731230106-e57e4534cf9b
	github.com/gonum/lapack v0.0.0-20170731225844-5ed4b826becd
	github.com/gonum/matrix v0.0.0-20170731230223-dd6034299e42
	github.com/google/go-cmp v0.3.0
	github.com/google/gofuzz v1.0.0
	github.com/google/uuid v1.1.1
	github.com/googleapis/gnostic v0.0.0-20170729233727-0c5108395e2d
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
	github.com/hashicorp/golang-lru v0.5.1
	github.com/imdario/mergo v0.3.5
	github.com/inconshreveable/mousetrap v1.0.0
	github.com/json-iterator/go v1.1.7
	github.com/jteeuwen/go-bindata v0.0.0-20151023091102-a0ff2567cfb7
	github.com/konsorten/go-windows-terminal-sequences v1.0.1
	github.com/mailru/easyjson v0.0.0-20160728113105-d5b7844b561a
	github.com/matttproud/golang_protobuf_extensions v1.0.1
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
	github.com/modern-go/reflect2 v1.0.1
	github.com/munnerz/goautoneg v0.0.0-20120707110453-a547fc61f48d
	github.com/openshift/api v0.0.0-20191001124347-8033e226059b
	github.com/openshift/client-go v0.0.0-20191001081553-3b0e988f8cb0
	github.com/openshift/library-go v0.0.0-20190927184318-c355e2019bb3
	github.com/pborman/uuid v1.2.0
	github.com/pkg/profile v1.3.0
	github.com/prometheus/client_golang v0.9.2
	github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910
	github.com/prometheus/common v0.0.0-20181126121408-4724e9255275
	github.com/prometheus/procfs v0.0.0-20181204211112-1dc9a6cbc91a
	github.com/sirupsen/logrus v1.4.2
	github.com/spf13/cobra v0.0.4
	github.com/spf13/pflag v1.0.3
	github.com/stretchr/testify v0.0.0-20180319223459-c679ae2cc0cb
	go.uber.org/atomic v0.0.0-20181018215023-8dc6146f7569
	go.uber.org/multierr v0.0.0-20180122172545-ddea229ff1df
	go.uber.org/zap v0.0.0-20180814183419-67bc79d13d15
	golang.org/x/crypto v0.0.0-20181025213731-e84da0312774
	golang.org/x/net v0.0.0-20190812203447-cdfb69ac37fc
	golang.org/x/oauth2 v0.0.0-20190402181905-9f3314589c9a
	golang.org/x/sys v0.0.0-20190209173611-3b5209105503
	golang.org/x/text v0.0.0-20181227161524-e6919f6577db
	golang.org/x/time v0.0.0-20161028155119-f51c12702a4d
	golang.org/x/tools v0.0.0-20190312170243-e65039ee4138
	google.golang.org/appengine v1.5.0
	google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7
	google.golang.org/grpc v1.19.0
	gopkg.in/inf.v0 v0.9.0
	gopkg.in/natefinch/lumberjack.v2 v2.0.0
	gopkg.in/yaml.v2 v2.2.2
	k8s.io/api v0.0.0-20190918155943-95b840bb6a1f
	k8s.io/apiextensions-apiserver v0.0.0-20190918161926-8f644eb6e783
	k8s.io/apimachinery v0.0.0-20190913080033-27d36303b655
	k8s.io/apiserver v0.0.0-20190918160949-bfa5e2e684ad
	k8s.io/client-go v0.0.0-20190918160344-1fbdaa4c8d90
	k8s.io/code-generator v0.0.0-20190912054826-cd179ad6a269
	k8s.io/component-base v0.0.0-20190831155902-10a404db9bd0
	k8s.io/gengo v0.0.0-20190822140433-26a664648505
	k8s.io/klog v0.4.0
	k8s.io/kube-aggregator v0.0.0-20190918161219-8c8f079fddc3
	k8s.io/kube-openapi v0.0.0-20190816220812-743ec37842bf
	k8s.io/utils v0.0.0-20190801114015-581e00157fb1
	sigs.k8s.io/structured-merge-diff v0.0.0-20190724202554-0c1d754dd648
	sigs.k8s.io/yaml v1.1.0
)

replace (
	github.com/jteeuwen/go-bindata => github.com/jteeuwen/go-bindata v3.0.8-0.20151023091102-a0ff2567cfb7+incompatible
	github.com/openshift/api => github.com/openshift/api v3.9.1-0.20191008181517-e4fd21196097+incompatible
	github.com/openshift/client-go => github.com/openshift/client-go v0.0.0-20191001081553-3b0e988f8cb0
	github.com/openshift/library-go => github.com/openshift/library-go v0.0.0-20191010122109-dcc800bef43a
	github.com/stretchr/testify => github.com/stretchr/testify v1.2.2-0.20180319223459-c679ae2cc0cb
	k8s.io/api => k8s.io/api v0.0.0-20190918155943-95b840bb6a1f
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190913080033-27d36303b655
	k8s.io/apiserver => k8s.io/apiserver v0.0.0-20190918160949-bfa5e2e684ad
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190918160344-1fbdaa4c8d90
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190912054826-cd179ad6a269
	k8s.io/component-base => k8s.io/component-base v0.0.0-20190918160511-547f6c5d7090
	k8s.io/gengo => k8s.io/gengo v0.0.0-20190822140433-26a664648505
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.0.0-20190918161219-8c8f079fddc3
)

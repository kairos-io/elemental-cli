module github.com/rancher/elemental-cli

go 1.16

// until https://github.com/zloylos/grsync/pull/20 is merged we need to use our fork
replace github.com/zloylos/grsync v1.6.1 => github.com/rancher-sandbox/grsync v1.6.2-0.20220526080038-4032e9b0e97c

require (
	github.com/Masterminds/sprig/v3 v3.2.3 // indirect
	github.com/Microsoft/go-winio v0.6.0 // indirect
	github.com/ProtonMail/go-crypto v0.0.0-20230117203413-a47887b8f098 // indirect
	github.com/cavaliergopher/grab/v3 v3.0.1
	github.com/cloudflare/circl v1.3.1 // indirect
	github.com/distribution/distribution v2.8.1+incompatible
	github.com/docker/docker v20.10.23+incompatible
	github.com/docker/go-units v0.4.0
	github.com/go-git/go-git/v5 v5.5.2 // indirect
	github.com/hashicorp/go-getter v1.6.1
	github.com/hashicorp/go-multierror v1.1.1
	github.com/huandu/xstrings v1.4.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/itchyny/gojq v0.12.11 // indirect
	github.com/jaypipes/ghw v0.9.1-0.20220511134554-dac2f19e1c76
	github.com/joho/godotenv v1.4.0
	github.com/mitchellh/mapstructure v1.4.3
	github.com/mudler/go-pluggable v0.0.0-20211206135551-9263b05c562e
	github.com/mudler/luet v0.0.0-20230117111542-5d3751888844
	github.com/mudler/yip v0.11.5-0.20230124143654-91e88dfb6648
	github.com/onsi/ginkgo/v2 v2.7.0
	github.com/onsi/gomega v1.26.0
	github.com/philopon/go-toposort v0.0.0-20170620085441-9be86dbd762f // indirect
	github.com/pterm/pterm v0.12.32-0.20211002183613-ada9ef6790c3 // indirect
	github.com/sanity-io/litter v1.5.5
	github.com/sergi/go-diff v1.3.1 // indirect
	github.com/sirupsen/logrus v1.9.0
	github.com/spf13/cobra v1.6.1
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.10.0
	github.com/twpayne/go-vfs v1.7.2
	github.com/vishvananda/netlink v1.2.1-beta.2 // indirect
	github.com/zloylos/grsync v1.6.1
	golang.org/x/crypto v0.5.0 // indirect
	golang.org/x/net v0.5.0 // indirect
	golang.org/x/tools v0.5.0 // indirect
	gopkg.in/ini.v1 v1.67.0 // indirect
	gopkg.in/yaml.v3 v3.0.1
	k8s.io/klog/v2 v2.30.0 // indirect
	k8s.io/mount-utils v0.23.0
)

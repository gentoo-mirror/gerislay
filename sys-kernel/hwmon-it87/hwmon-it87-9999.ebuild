# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Dead but better out of tree it87 module"
HOMEPAGE="https://github.com/koenkooi/it87"
EGIT_REPO_URI="https://github.com/koenkooi/it87"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CONFIG_CHECK="HWMON HWMON_VID !PPC !SENSORS_IT87"
MODULE_NAMES="it87(kernel/drivers/hwmon:${S})"

pkg_setup() {
	linux-mod_pkg_setup

	BUILD_TARGETS="clean modules"
	BUILD_PARAMS="KVERSION=${KV_FULL} CC=$(tc-getCC)"
}

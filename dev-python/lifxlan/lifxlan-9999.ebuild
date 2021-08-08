# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{8..10} )
inherit distutils-r1 git-r3

DESCRIPTION="Python library for accessing LIFX devices using the official LIFX LAN protocol."
HOMEPAGE="https://github.com/mclarkk/lifxlan"
EGIT_REPO_URI="https://github.com/mclarkk/lifxlan.git"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/bitstring[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

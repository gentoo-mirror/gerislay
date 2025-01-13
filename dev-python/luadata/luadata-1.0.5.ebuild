# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Serialize Python list & dictionary to Lua tables."
HOMEPAGE="https://pypi.org/project/luadata/"
SRC_URI="https://github.com/leafvmaple/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

distutils_enable_sphinx docs
distutils_enable_tests setup.py


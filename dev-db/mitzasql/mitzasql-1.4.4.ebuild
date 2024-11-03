# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="MySQL command line / text based interface client"
HOMEPAGE="vladbalmos.github.io/mitzasql/"
SRC_URI="https://github.com/vladbalmos/mitzasql/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/urwid[${PYTHON_USEDEP}]
	dev-python/mysql-connector-python[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"

src_prepare() {
	# tests are going to be installed normally. This should be a bug upstream.
	# We "fix" it by removing tests all together. TODO: fix setup.py properly.
	rm -r "${S}/tests" || die "Tests could not removed"
	distutils-r1_python_prepare_all
}

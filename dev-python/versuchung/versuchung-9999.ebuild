# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

PYTHON_COMPAT=( python3_{10..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/stettberger/${PN}.git"

DESCRIPTION="a toolbox for experiments"
HOMEPAGE="https://github.com//stettberger/versuchung"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
  dev-python/luadata[${PYTHON_USEDEP}]
  dev-python/pandas[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

BDEPEND="
    test? (
        dev-build/make
		sys-apps/findutils
    )
"

PATCHES=(
	"${FILESDIR}"/dont-run-jupyter-tests.patch
)

distutils_enable_sphinx docs

python_test() {
	make -C tests PYTHON="${EPYTHON}" || die
}


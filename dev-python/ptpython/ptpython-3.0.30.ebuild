# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python REPL build on top of prompt_toolkit"
HOMEPAGE="https://pypi.org/project/ptpython/ https://github.com/prompt-toolkit/ptpython"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/jedi[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.18[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-3.1.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="A CSP library for Python"
HOMEPAGE="https://github.com/runefriborg/pycsp"
SRC_URI="https://github.com/runefriborg/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${RDEPEND}
    dev-python/setuptools[${PYTHON_USEDEP}]"

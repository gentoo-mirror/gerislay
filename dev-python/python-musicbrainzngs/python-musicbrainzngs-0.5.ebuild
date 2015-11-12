# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python bindings for the MusicBrainz NGS and the Cover Art Archive webservices"
HOMEPAGE="https://github.com/alastair/python-musicbrainzngs"
SRC_URI="https://github.com/alastair/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2 ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RDEPEND=""
DEPEND="${RDEPEND}
	!dev-python/python-musicbrainz-ngs
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install_all() {
	use examples && local EXAMPLES=( examples )

	distutils-r1_python_install_all
}

python_test() {
	"${PYTHON}" setup.py test || die
}

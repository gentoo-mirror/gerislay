# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/imdbpy/imdbpy-4.9-r1.ebuild,v 1.1 2013/06/23 17:43:11 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_3} pypy2_0 )

inherit distutils-r1

MY_PN="IMDbPY"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python package to access the IMDb movie database"
HOMEPAGE="http://imdbpy.sourceforge.net/ http://pypi.python.org/pypi/IMDbPY"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/configparser"
RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

DISTUTILS_GLOBAL_OPTIONS=("*-jython --without-cutils")
DOCS=( docs/FAQS.txt docs/imdbpy48.dtd docs/imdbpy.cfg )

PATCHES=( "${FILESDIR}/updateToPython3.patch" "${FILESDIR}/${PN}-4.6-data_location.patch" )

src_configure() {
	distutils-r1_src_configure --without-cutils
}

python_install_all() {
	local doc
	for doc in docs/README*
	do
		DOCS=( "${DOCS[@]}" $doc )
	done
	distutils-r1_python_install_all
}

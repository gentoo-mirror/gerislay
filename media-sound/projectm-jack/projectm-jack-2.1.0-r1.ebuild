# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

MY_P=${PN/m-jack/M}-complete-${PV}-Source

DESCRIPTION="A Qt based GUI for projectM that visualizes your JACK output"
HOMEPAGE="http://projectm.sourceforge.net"
SRC_URI="mirror://sourceforge/projectm/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/jack
	>=media-libs/libprojectm-qt-2.1.0
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}/src/${PN/m/M}"

src_install() {
	# see https://bugs.gentoo.org/show_bug.cgi?id=588898
	einfo "Patching RPATH"
	patchelf --set-rpath '-lprojectM:-L/usr/lib64/qt4:-lQtXml:-lQtOpenGL:-lQtGui:-lQtCore:/usr/lib64/qt4:' "${WORKDIR}/${P}_build/projectM-jack"

	cmake-utils_src_install
}

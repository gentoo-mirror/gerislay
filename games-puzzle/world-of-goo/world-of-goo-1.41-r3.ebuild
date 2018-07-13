# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils games unpacker

DESCRIPTION="A puzzle game with a strong emphasis on physics"
HOMEPAGE="http://2dboy.com/"

MY_PN="WorldOfGoo"
SRC_URI="${MY_PN}Setup.${PV}.deb"

LICENSE="2dboy-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="fetch strip"

RDEPEND="media-libs/libsdl[alsa,sound,opengl,video]
	media-libs/sdl-mixer[vorbis]
	sys-libs/glibc
	virtual/opengl
	virtual/glu
	>=sys-devel/gcc-3.4"
DEPEND=""

S=${WORKDIR}

QA_PREBUILT="opt/${MY_PN}/${MY_PN}.bin64"

pkg_nofetch() {
	elog "Place ${A} in ${DISTDIR}"
}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	rm -R opt/${MY_PN}/libs32
	rm opt/${MY_PN}/${MY_PN}.bin32
	cp -R opt/ "${D}/" || die "Could not copy."
	cp -R usr/ "${D}/" || die "Could not copy."
}

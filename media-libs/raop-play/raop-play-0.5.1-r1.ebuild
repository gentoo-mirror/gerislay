# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils flag-o-matic multilib

MY_P=${PN/-/_}-${PV}

DESCRIPTION=""
HOMEPAGE="http://raop-play.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl
	media-libs/libid3tag
	media-libs/libsamplerate
	x11-libs/fltk"
DEPEND="${RDEPEND}
	dev-libs/glib:2"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc44.patch
	sed -i \
		-e 's:$(CXX) -o:$(CXX) $(LDFLAGS) $(CXXFLAGS) -o:' \
		aexcl/Makefile.in || die
}

src_configure() {
	append-cxxflags "-I/usr/include/fltk-1.1"
	append-ldflags "-L/usr/$(get_libdir)/fltk-1.1"
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc CHANGELOG README
}

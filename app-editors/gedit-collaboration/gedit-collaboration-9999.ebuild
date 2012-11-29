# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://git.gnome.org/gedit-collaboration"

inherit eutils git-2

DESCRIPTION="GNOME Text Editor Collaboration Plugin"
HOMEPAGE="http://git.gnome.org/browse/gedit-collaboration"
SRC_URI=""

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=net-libs/libinfinity-0.5[gtk]
	>=app-editors/gedit-3.0
	>=x11-libs/gtk+-3.3.15
	dev-libs/libxml2"
RDEPEND="${DEPEND}"

src_prepare() {
		# Run autotools
		einfo "Regenerating autotools files..."
		NOCONFIGURE=yes ./autogen.sh || die "autogen,sh failed"
}

src_install() {
		emake DESTDIR="${D}" install || die "Install failed"
		dodoc README ChangeLog AUTHORS NEWS ABOUT-NLS || die
}

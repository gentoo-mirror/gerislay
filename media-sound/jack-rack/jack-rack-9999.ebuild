# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit autotools-utils eutils git-2

DESCRIPTION="JACK Rack is an effects rack for the JACK low latency audio API."
HOMEPAGE="http://jack-rack.sourceforge.net/"
EGIT_REPO_URI="git://jack-rack.git.sourceforge.net/gitroot/jack-rack/jack-rack"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="alsa gnome lash nls xml"

RDEPEND="x11-libs/gtk+:2
	>=media-libs/ladspa-sdk-1.12
	media-sound/jack-audio-connection-kit
	alsa? ( media-libs/alsa-lib )
	lash? ( virtual/liblash )
	gnome? ( >=gnome-base/libgnomeui-2 )
	nls? ( virtual/libintl )
	xml? ( dev-libs/libxml2
		media-libs/liblrdf )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

AUTOTOOLS_AUTORECONF="1"
DOCS=( AUTHORS BUGS ChangeLog NEWS README THANKS TODO WISHLIST )

src_configure() {
	myeconfargs=(
		$(use_enable alsa aseq)
		$(use_enable gnome)
		$(use_enable lash)
		$(use_enable nls)
		$(use_enable xml)
		$(use_enable xml lrdf)
	)
	autotools-utils_src_configure
}

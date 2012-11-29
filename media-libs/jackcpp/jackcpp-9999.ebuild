# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/x37v/jackcpp.git"

inherit eutils git-2

DESCRIPTION="C++ class wrapping most of the jack client functionality"
HOMEPAGE="http://x37v.info/projects/jackcpp"
SRC_URI=""

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-sound/jack-audio-connection-kit"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/destdir.patch"
}


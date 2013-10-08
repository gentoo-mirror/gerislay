# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 autotools

DESCRIPTION="libflashsupport.so for Adobe Flash with jack support"
HOMEPAGE="http://repo.or.cz/w/libflashsupport-jack.git"
LICENSE="GPL-2"
SLOT="0"
EGIT_REPO_URI="git://repo.or.cz/libflashsupport-jack.git"

IUSE=""

KEYWORDS=""
DEPEND="media-libs/libsamplerate
	dev-libs/openssl
	media-sound/jack-audio-connection-kit"

S="${WORKDIR}/${PN}"
EGIT_BOOTSTRAP="./bootstrap.sh"

src_unpack() {
	git_src_unpack || die "unpack failed"
	# v4l1 is outdated and no longer into the linux kernel
	cd ${S}
	epatch "${FILESDIR}/remove-v4l1.patch" || die "epatch failed"
}

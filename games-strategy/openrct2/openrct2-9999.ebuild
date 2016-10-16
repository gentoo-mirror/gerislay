# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Open source re-implementation of Roller Coaster Tycoon 2"
HOMEPAGE="https://openrct2.website/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="curl openssl"

EGIT_REPO_URI="https://github.com/OpenRCT2/OpenRCT2.git"

DEPEND="media-libs/libsdl2[abi_x86_32]
	media-libs/sdl2-ttf[abi_x86_32]
	media-libs/speex[abi_x86_32]
	media-libs/fontconfig[abi_x86_32]
	dev-libs/jansson[abi_x86_32]
	curl? ( net-misc/curl[abi_x86_32] )
	openssl? ( dev-libs/openssl[abi_x86_32] )"
RDEPEND="${DEPENDS}"

pkg_postinst() {
	elog "Please note, you still need the original game assets"
	elog "to play this game. See also: https://openrct2.com/"
}

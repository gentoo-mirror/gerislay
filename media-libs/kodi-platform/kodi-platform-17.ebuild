# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

EGIT_REPO_URI="https://github.com/xbmc/kodi-platform"
if [[ $PV = 17 ]]; then
	EGIT_COMMIT="92583ef9f87bfcea1f2b4fc1310fdc673a2fe924" #Bump debian version to v17"
fi

DESCRIPTION="Kodi platform support library http://www.kodi.tv"
HOMEPAGE="https://github.com/xbmc/kodi-platform"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
if [[ $PV = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
fi
IUSE=""

DEPEND="
	media-libs/p8-platform
	media-tv/kodi
"
RDEPEND="${DEPEND}"

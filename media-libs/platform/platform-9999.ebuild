# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

EGIT_REPO_URI="https://github.com/Pulse-Eight/platform"
#temporary fix, remove once kodi-platform has updated
EGIT_COMMIT="a1e5905874d5cdbce110344558d21a2810dead9c"

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi"
HOMEPAGE="https://github.com/Pulse-Eight/platform"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

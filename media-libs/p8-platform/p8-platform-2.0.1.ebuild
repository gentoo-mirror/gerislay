# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi"
HOMEPAGE="https://github.com/Pulse-Eight/platform"
SRC_URI="https://github.com/Pulse-Eight/platform/archive/${P}.tar.gz"

S="${WORKDIR}/platform-${P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

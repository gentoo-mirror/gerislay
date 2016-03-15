# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Tvheadend HTSP PVR client addon for Kodi"
HOMEPAGE="https://github.com/kodi-pvr/pvr.hts"
SRC_URI="https://github.com/kodi-pvr/pvr.hts/archive/2.2.13.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/kodi-platform
		=media-tv/kodi-16*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/pvr.hts-${PV}"

PATCHES=( "${FILESDIR}/${P}-platform-renaming.patch" )

src_configure() {
        local mycmakeargs=(
                -DCMAKE_INSTALL_LIBDIR="${EPREFIX}"/usr/lib64/kodi
        )

        cmake-utils_src_configure
}


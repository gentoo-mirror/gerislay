# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

EGIT_REPO_URI="https://github.com/kodi-pvr/pvr.hts.git"

DESCRIPTION="Tvheadend HTSP PVR client addon for Kodi"
HOMEPAGE="https://github.com/kodi-pvr/pvr.hts"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/kodi-platform"
RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
                -DCMAKE_INSTALL_LIBDIR="${EPREFIX}"/usr/lib64/kodi
        )

        cmake-utils_src_configure
}


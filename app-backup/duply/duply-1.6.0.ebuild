# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Shell front end for the duplicity backup tool"
HOMEPAGE="http://duply.net/"
SRC_URI="mirror://sourceforge/ftplicity/${PN}_${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-backup/duplicity"

S="${WORKDIR}"/${PN}_${PV}

src_install() {
	dobin duply
}

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Implementation of xmpp message delivery receipts (XEP-0184) for Pidgin"
HOMEPAGE="https://www.assembla.com/spaces/pidgin-xmpp-receipts/documents"
SRC_URI="https://www.assembla.com/spaces/pidgin-xmpp-receipts/documents/ckA6jCV5Kr4OkjacwqjQXA/download/ckA6jCV5Kr4OkjacwqjQXA -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-install-globally.patch"
}

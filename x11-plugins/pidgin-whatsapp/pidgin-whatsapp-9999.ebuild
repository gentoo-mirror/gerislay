# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://bitbucket.org/davidgfnet/whatsapp-purple.git"

inherit eutils git-2

DESCRIPTION="Adds Whatsapp protocol support for Pidgin"
HOMEPAGE="http://davidgf.net/page/39/whatsapp-on-your-computer:-pidgin-plugin"
SRC_URI=""

LICENSE="GPLv2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"


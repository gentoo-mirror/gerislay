# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_6 )
inherit distutils-r1 git-r3

DESCRIPTION="A Python implementation of Lirc."
HOMEPAGE="https://gitlab.com/geri0n/plirc"

EGIT_REPO_URI="https://gitlab.com/geri0n/plirc.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/pyserial
	dev-python/python-daemon"
RDEPEND="${DEPEND}"

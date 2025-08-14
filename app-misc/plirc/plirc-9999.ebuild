# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="A Python implementation of Lirc."
HOMEPAGE="https://gitlab.com/geri0n/plirc"

EGIT_REPO_URI="https://gitlab.com/geri0n/plirc.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/pyserial[${PYTHON_USEDEP}]
	>=dev-python/python-daemon-2[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

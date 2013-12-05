# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_3} )

EGIT_REPO_URI="https://github.com/goldsmith/Wikipedia.git"

inherit distutils-r1 git-r3

DESCRIPTION="A Pythonic wrapper for the Wikipedia API"
HOMEPAGE="https://github.com/goldsmith/Wikipedia"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
		 =dev-python/requests-1.2.3[${PYTHON_USEDEP}]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

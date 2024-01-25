# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{9..12} pypy3 )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/stettberger/${PN}.git"

DESCRIPTION="a toolbox for experiments"
HOMEPAGE="https://github.com//stettberger/versuchung"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

distutils_enable_sphinx docs
distutils_enable_tests setup.py


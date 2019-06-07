# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} )

EGIT_REPO_URI="https://github.com/stettberger/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="a toolbox for experiments"
HOMEPAGE="https://github.com//stettberger/versuchung"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

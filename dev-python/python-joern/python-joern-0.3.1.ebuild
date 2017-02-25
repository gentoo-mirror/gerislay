# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Some simple code analysis tools build on top of joern."
HOMEPAGE="https://github.com/fabsx00/python-joern"
SRC_URI="https://github.com/fabsx00/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/py2neo"
RDEPEND="${DEPEND}"

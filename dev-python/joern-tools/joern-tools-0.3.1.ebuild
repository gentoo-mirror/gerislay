# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Some simple code analysis tools build on top of joern."
HOMEPAGE="https://github.com/octopus-platform/joern-tools"
SRC_URI="https://github.com/octopus-platform/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-gfx/graphviz
	dev-python/python-joern"
RDEPEND="${DEPEND}"

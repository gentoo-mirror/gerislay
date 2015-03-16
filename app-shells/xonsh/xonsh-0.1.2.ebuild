# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_4 )

inherit distutils-r1

DESCRIPTION="A Python-ish, BASHwards-compatible shell"
HOMEPAGE="http://xonsh.org"
SRC_URI="https://github.com/scopatz/${PN}/archive/${PV}.tar.gz"

LICENSE="xonsh"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE=""


RDEPEND="dev-python/ply[${PYTHON_USEDEP}]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DOCS=( README.rst )

PATCHES=( "${FILESDIR}"/${PN}-nologoprint.patch )

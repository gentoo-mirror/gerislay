# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{8..11} )
inherit distutils-r1

DESCRIPTION="A Python library for OAuth 1.0/a, 2.0, and Ofly."
HOMEPAGE="https://github.com/litl/rauth"
SRC_URI="https://github.com/litl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

PATCHES=( "${FILESDIR}/${P}-fix-python-3.6.patch" )

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	test? ( dev-python/unittest2[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

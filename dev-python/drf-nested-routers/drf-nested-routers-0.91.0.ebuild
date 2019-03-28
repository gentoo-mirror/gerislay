# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="Nested Routers for Django Rest Framework"
HOMEPAGE="https://github.com/alanjds/drf-nested-routers"
SRC_URI="https://github.com/alanjds/${PN}/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# TODO test useflag
IUSE=""

DEPEND="
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/djangorestframework[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

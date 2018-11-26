# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="Tool to produce a single html file from a single junit xml file."
HOMEPAGE="https://gitlab.com/inorton/junit2html"
SRC_URI="https://gitlab.com/inorton/${PN}/-/archive/v0${PV}/${PN}-v0${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}-v0${PV}"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

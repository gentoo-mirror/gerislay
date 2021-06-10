# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://bitbucket.org/lalinsky/mbdata.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://bitbucket.org/lalinsky/${PN}/get/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit distutils-r1

DESCRIPTION="MusicBrainz Database Tools"
HOMEPAGE="https://bitbucket.org/lalinsky/mbdata"

LICENSE="MIT"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-python/sqlalchemy-0.9.8[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}]
	dev-python/python-sqlparse[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="An LDAP3 auth provider for Synapse"
HOMEPAGE="https://pypi.python.org/pypi/matrix-synapse-ldap3 https://github.com/matrix-org/matrix-synapse-ldap3"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/twisted
	dev-python/ldap3
	dev-python/service_identity
"

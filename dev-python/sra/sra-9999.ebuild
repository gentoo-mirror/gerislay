# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_5 python3_6 )
inherit distutils-r1 git-r3

DESCRIPTION="SRA Command Line Tools"
HOMEPAGE="https://scm.sra.uni-hannover.de/source/sra-cli/"
EGIT_REPO_URI="file:///home/gerion/sourcecode/sra-cli"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/rauth[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/fusepy[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

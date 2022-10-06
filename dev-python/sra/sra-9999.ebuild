# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 git-r3

DESCRIPTION="SRA Command Line Tools"
HOMEPAGE="https://scm.sra.uni-hannover.de/published/sra-cli"
EGIT_REPO_URI="https://scm.sra.uni-hannover.de/published/sra-cli.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qis"

DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/rauth[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/fusepy[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-vcs/python-gitlab[${PYTHON_USEDEP}]
	qis? ( app-shells/fzf )"
RDEPEND="${DEPEND}"

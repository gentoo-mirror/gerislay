# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1 git-r3

DESCRIPTION="Create matplotlib plots with broken axes"
HOMEPAGE="https://github.com/bendichter/brokenaxes"
EGIT_REPO_URI="https://github.com/bendichter/brokenaxes"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/matplotlib[$PYTHON_USEDEP]"
RDEPEND="${DEPEND}"
BDEPEND=""

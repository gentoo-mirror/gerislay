# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Use Vim as PAGER"
HOMEPAGE=i"https://www.vim.org/scripts/script.php?script_id=1723"
EGIT_REPO_URI="https://github.com/rkitover/${PN}.git"

LICENSE="MIT VIM4 BSD2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+pandoc doctoc"

DEPEND="|| ( app-editors/vim app-editors/neovim )
	app-arch/sharutils
	pandoc? ( app-text/pandoc )
	doctoc? ( app-doc/doctoc )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}

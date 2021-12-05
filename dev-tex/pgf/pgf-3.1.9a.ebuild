# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 latex-package

DESCRIPTION="The TeX Portable Graphic Format"
HOMEPAGE="https://github.com/pgf-tikz/pgf"
EGIT_REPO_URI="https://github.com/pgf-tikz/pgf.git"
EGIT_COMMIT="${PV}"
SRC_URI=" doc? ( https://github.com/pgf-tikz/pgf/releases/download/${PV}/pgfmanual-${PV}.pdf -> ${P}-pgfmanual.pdf )"

LICENSE="GPL-2 LPPL-1.3c FDL-1.2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc source"

RDEPEND="dev-texlive/texlive-latexrecommended"

src_install() {
	scripts/pgf/pgfrevisionfile.sh
	insinto "${TEXMF}"
	doins -r tex

	if use source ; then
		doins -r source
	fi

	cd "${S}/doc/generic/pgf" || die
	dodoc ChangeLog INSTALL RELEASE_NOTES.md description.html
	if use doc; then
		docinto texdoc
		# pgfmanual is now split from the main tar archive
		newdoc "${DISTDIR}/${P}-pgfmanual.pdf" pgfmanual.pdf
		doins -r images text-en licenses version-*

		dosym "../../../doc/${PF}/texdoc" "${TEXMF}/doc/latex/${PN}"
		docompress -x "/usr/share/doc/${P}/texdoc/"
	fi
}

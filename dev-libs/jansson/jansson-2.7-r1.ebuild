# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
AUTOTOOLS_AUTORECONF=1

inherit autotools-multilib

DESCRIPTION="C library for encoding, decoding and manipulating JSON data"
HOMEPAGE="http://www.digip.org/jansson/"
SRC_URI="http://www.digip.org/jansson/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs"

DEPEND="doc? ( >=dev-python/sphinx-1.0.4 )"
RDEPEND=""

DOCS=(CHANGES README.rst)

multilib_src_prepare() {
	sed -ie 's/-Werror//' src/Makefile.am || die
	autotools-utils_src_prepare
}

multilib_src_compile() {
	autotools-utils_src_compile

	use doc && autotools-utils_src_compile html
}

multilib_src_install_all() {
	use doc && HTML_DOCS=("${AUTOTOOLS_BUILD_DIR}/doc/_build/html/")
	autotools-utils_src_install
}

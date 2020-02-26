# Copyright 2017-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.2.0

EAPI=7

inherit cargo

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/xiph/rav1e.git"
	inherit git-r3
fi

DESCRIPTION="The fastest and safest AV1 encoder"
HOMEPAGE="https://github.com/xiph/rav1e/"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="BSD-2"
SLOT="0"

KEYWORDS=""
IUSE="library"

ASM_DEP=">=dev-lang/nasm-2.14"
DEPEND="
	amd64? ( ${ASM_DEP} )
	library? ( dev-util/cargo-c )
"
RDEPEND=""

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	fi
}

src_compile() {
	cargo_src_compile
	if use library ; then
		cargo cbuild --release || die
	fi
}

src_install() {
	cargo_src_install
	if use library ; then
		cargo cinstall --destdir="${ED}" --prefix="/usr" --libdir "/usr/lib64" --release || die
		# cargo cinstall seems not to work here so dirty patch the generated pc file
		sed -i 's,prefix=/usr/local,prefix=/usr,;s,^\(libdir.*\),\164,' "${ED}"/usr/lib64/pkgconfig/rav1e.pc
	fi
}

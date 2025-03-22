# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit git-r3 python-r1 xdg cmake
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
# this URL is to make the tests compile since organicmaps usually dynamically clones the repo
# maybe a better way would be to skip the test
EGIT_WORLD_FEED_REPO_URI="https://github.com/${PN}/world_feed_integration_tests_data.git"
# organicmaps gets more and more system libraries, we use as many
# as currently possible, use submodules for the rest
EGIT_SUBMODULES=(
	3party/just_gtfs  # header contains #include 3party/just_gtfs
	3party/protobuf/protobuf # wait for https://github.com/organicmaps/organicmaps/pull/6310
	3party/fast_obj  # header contains #include 3party/fast_obj
)

DESCRIPTION="Offline maps and navigation using OpenStreetMap data"
HOMEPAGE="https://organicmaps.app"

LICENSE="Apache-2.0"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# depend on sys-libs/zlib[minizip] when it is not pulled in as subproject anymore
RDEPEND="
	>dev-cpp/fast_double_parser-0.7.0
	dev-cpp/gflags
	dev-db/sqlite
	dev-lang/python
	dev-libs/boost
	dev-libs/expat
	dev-libs/icu
	dev-libs/jansson
	>=dev-libs/utfcpp-4
	dev-qt/qtbase:6[gui,network,opengl,widgets]
	dev-qt/qtpositioning:6
	dev-qt/qtsvg:6
	>=dev-util/vulkan-headers-1.3.280
	media-libs/harfbuzz
	media-libs/freetype
	media-libs/libglvnd
	sys-libs/zlib
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/fix-3party.patch  # upstream PR #6310
	"${FILESDIR}"/fix-jansson.patch  # upstream PR #7982
	"${FILESDIR}"/make-DEV_SANDBOX-optional.patch
	"${FILESDIR}"/fix-integration-of-search_tests_support.patch
)

WORLD_FEED_TESTS_S="${WORKDIR}/world_feed_integration_tests_data-${PV}"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	git-r3_fetch "${EGIT_WORLD_FEED_REPO_URI}"
	git-r3_checkout "${EGIT_WORLD_FEED_REPO_URI}" "${WORLD_FEED_TESTS_S}"
}

src_configure() {
	CMAKE_BUILD_TYPE="RelWithDebInfo"
	local mycmakeargs=(
		-DWITH_SYSTEM_PROVIDED_3PARTY=yes
		-DDEV_SANDBOX=off  # TODO: uses a bunch of other dependencies, package and enable it with a use flag
		-DSKIP_TOOLS=yes # TODO: mostly tests, enable with use flag
		-DSKIP_TESTS=yes # TODO: mostly tests, enable with use flag
		-DBUILD_SHARED_LIBS=off
		-DTEST_DATA_REPO_URL="${WORLD_FEED_TESTS_S}"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# Remove test data
	rm -rf "${ED}"/usr/share/${PN}/data/test_data || die
}

pkg_postinst() {
	xdg_icon_cache_update

	einfo "For dark  mode type in search ?dark"
	einfo "For light mode type in search ?light"
}

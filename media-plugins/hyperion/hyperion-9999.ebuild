# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils systemd

DESCRIPTION="An opensource 'AmbiLight' implementation supported by many devices"
HOMEPAGE="https://hyperion-project.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hyperion-project/${PN}"
EGIT_SUBMODULES=()

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="dispmanx framebuffer spi +qt5 vfl X"

DEPEND="x11-libs/libXrender
	dev-util/cmake
	virtual/libusb
	dev-libs/icu
	qt5? ( dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtnetwork:5
		dev-qt/qtserialport:5 )
	dev-lang/python
	net-dns/avahi
	dev-libs/protobuf"
RDEPEND="${DEPEND}"

pkg_setup() {
	HYPERION_HOME="/var/lib/hyperion"
	ebegin "Creating hyperion user and group"
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "${HYPERION_HOME}" ${PN}
	eend $?
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DISPMANX="$(usex dispmanx)"
		-DENABLE_FB="$(usex framebuffer)"
		-DENABLE_SPIDEV="$(usex spi)"
		-DENABLE_QT5="$(usex qt5)"
		-DENABLE_VFL2="$(usex vfl)"
		-DENABLE_X11="$(usex X)"
		-DCMAKE_BUILD_TYPE=Release
		-DUSE_SYSTEM_PROTO_LIBS=on
		-DUSE_SHARED_AVAHI_LIBS=on
		-DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc
		-DPLATFORM=x86
		-Wno-dev
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	insinto /etc/hyperion
	doins "${S}/config/hyperion.config.json.example"
	ewarn "The config file is also creatable with the GUI program HyperCon."

	newinitd "${FILESDIR}"/hyperion.initd hyperion

	systemd_newunit "${S}/bin/service/hyperion.systemd.sh" hyperion.service
}

# https://github.com/hyperion-project/hyperion/blob/master/CompileHowto.txt
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyperion-git

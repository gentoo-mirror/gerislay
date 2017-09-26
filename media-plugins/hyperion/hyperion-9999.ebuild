# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="An opensource 'AmbiLight' implementation supported by many devices"
HOMEPAGE="https://hyperion-project.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hyperion-project/${PN}"
EGIT_SUBMODULES=()

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="dispmanx framebuffer spi +qt5 vfl"

DEPEND="x11-libs/libXrender
	dev-util/cmake
	virtual/libusb
	dev-libs/icu
	qt5? ( dev-qt/qtcore:5
		dev-qt/qtserialport:5 )
	dev-lang/python
	net-dns/avahi
	dev-libs/protobuf"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_DISPMANX="$(usex dispmanx)"
		-DENABLE_FB="$(usex framebuffer)"
		-DENABLE_SPIDEV="$(usex spi)"
		-DENABLE_QT5="$(usex qt5)"
		-DENABLE_VFL2="$(usex vfl)"
		-DCMAKE_BUILD_TYPE=Release
		-DUSE_SYSTEM_PROTO_LIBS=on
		-DUSE_SHARED_AVAHI_LIBS=on
		-DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc
		-DPLATFORM=x86
		-Wno-dev
	)
	cmake-utils_src_configure
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="false"
PVCUT=$(ver_cut 1-3)
KFMIN=5.91.0
QTMIN=5.15.2
VIRTUALX_REQUIRED="test"
inherit ecm optfeature

DESCRIPTION="OTP client for Plasma Mobile and Desktop"
HOMEPAGE="https://invent.kde.org/utilities/keysmith"
SRC_URI="https://download.kde.org/stable/plasma-mobile/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE="+dbus"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	dbus? (
		>=kde-frameworks/kdbusaddons-${KFMIN}:5
		>=kde-frameworks/kwindowsystem-${KFMIN}:5
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(usex dbus "-DBUILD_DBUS_INTERFACE=TRUE")
	)
	ecm_src_configure
}

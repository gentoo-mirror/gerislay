# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/martinrotter/${PN}"
	EGIT_SUBMODULES=()
else
	SRC_URI="https://github.com/martinrotter/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Simple, light and easy-to-use RSS/ATOM feed aggregator developed using Qt framework"
HOMEPAGE="https://github.com/martinrotter/rssguard"

LICENSE="GPLv3"
SLOT="0"
IUSE="+webengine"

# minimum Qt version required
QT_PV="5.6.0:5"

DEPEND=">=dev-qt/qtcore-${QT_PV}
	>=dev-qt/qtgui-${QT_PV}
	>=dev-qt/qtwidgets-${QT_PV}
	>=dev-qt/qtsql-${QT_PV}
	>=dev-qt/qtnetwork-${QT_PV}
	>=dev-qt/qtxml-${QT_PV}
	webengine? ( >=dev-qt/qtwebengine-${QT_PV}[widgets] )"
RDEPEND="${DEPEND}"

src_configure() {
	use webengine && WEBENGINE="true" || WEBENGINE="false"
	eqmake5 PREFIX="${D}" USE_WEBENGINE="${WEBENGINE}"
}

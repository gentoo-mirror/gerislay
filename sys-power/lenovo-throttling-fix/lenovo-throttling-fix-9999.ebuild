# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit git-r3 distutils-r1 systemd

DESCRIPTION="Workaround for Intel throttling issues in Linux."
HOMEPAGE="https://github.com/erpalma/lenovo-throttling-fix.git"
EGIT_REPO_URI="https://github.com/erpalma/lenovo-throttling-fix.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-python/dbus-python-1.2.8
	dev-python/pygobject:3"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES="${FILESDIR}/fix-systemd.patch"

src_configure() {
	return
}

src_compile() {
	return
}

src_install()
{
	doinitd ${FILESDIR}/lenovo-throttling-fix
	systemd_dounit systemd/lenovo_fix.service

	exeinto /opt/lenovo_fix
	doexe lenovo_fix.py

	insinto /opt/lenovo_fix
	doins mmio.py

	insinto /etc
	doins etc/lenovo_fix.conf
}

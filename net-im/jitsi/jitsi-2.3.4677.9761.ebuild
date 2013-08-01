# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2 java-ant-2 eutils multilib prefix

DESCRIPTION="An audio/video SIP VoIP phone and instant messenger written in Java"
HOMEPAGE="http://www.jitsi.org/"
SRC_URI="https://download.jitsi.org/jitsi/nightly/src/${PN}-src-${PV}.zip"
# This download comes with 30 Mb of useless jars.
# SVN access is available, but requires an account at java.net.

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="" # FIXME: Should not use ALSA directly, unless USE="alsa", because e.g. PulseAudio could already use and block it.

RDEPEND=">=virtual/jdk-1.6"
DEPEND=">=virtual/jdk-1.6
	dev-java/xalan:0
	dev-java/ant-nodeps:0
	dev-util/patchelf"

S=${WORKDIR}/${PN}

QA_PREBUILT="usr/lib*/${PN}/lib/native/*"
EANT_BUILD_TARGET="rebuild"

src_prepare() {
	# Set RPATH for preserve-libs handling.
	local x jarch
	if [[ ${ARCH} == amd64 ]] ; then
		jarch=amd64
		cd lib/native/linux-64 || die
	else
		jarch=i386
		cd lib/native/linux || die
		rm *mozembed* || die
	fi
	local x jarch jdir
	jdir=$(java-config -o || die)
	for x in * ; do
		# Use \x7fELF header to separate ELF executables and libraries
		[[ -f ${x} && $(od -t x1 -N 4 "${x}") == *"7f 45 4c 46"* ]] || continue
		patchelf --set-rpath "\$ORIGIN:${jdir}/jre/lib/${jarch}:${jdir}/jre/lib/${jarch}/client:${jdir}/jre/lib/${jarch}/xawt:/usr/lib/${PN}/lib/native" "${x}" ||
			die "patchelf failed on ${x}"
	done
}

src_install() {

	# Netbeans bundles
	insinto /usr/$(get_libdir)/${PN}/sc-bundles
	doins sc-bundles/*.jar sc-bundles/os-specific/linux/*.jar

	# Other libraries
	insinto /usr/$(get_libdir)/${PN}/lib
	doins lib/* lib/os-specific/linux/*
	doins -r lib/bundle # Unnecessary?

	# Native libraries
	exeinto /usr/$(get_libdir)/${PN}/lib/native
	# WARNING: Foreign binaries!
	if [[ ${ARCH} == amd64 ]] ; then
		doexe lib/native/linux-64/*
	else
		doexe lib/native/linux/*
	fi

	# Make sure revdep-rebuild doesn’t complain about them.
	echo "SEARCH_DIRS_MASK=\"${EPREFIX}/usr/$(get_libdir)/${PN}/lib/native\"" > 50-"${PN}"
	insinto /etc/revdep-rebuild && doins "50-${PN}"

	# Starter item / icon
	insinto /usr/share/pixmaps
	doins resources/install/debian/${PN}.svg
	make_desktop_entry ${PN} Jitsi ${PN} "AudioVideo;Network;InstantMessaging;Chat;Telephony;VideoConference;Java;"

	# Generate man page from template
	sed -e 's/_PACKAGE_NAME_/jitsi/g' -e 's/_APP_NAME_/Jitsi/g' \
		resources/install/debian/jitsi.1.tmpl > "${T}/jitsi.1" || die
	doman "${T}/jitsi.1"

	# Install custom runscript
	exeinto /usr/bin
	dobin "${FILESDIR}/jitsi"

}

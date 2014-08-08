# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://nibbler.neboola.de/ci3nt/hdjmod.git"

inherit eutils linux-info linux-mod git-2

DESCRIPTION="GPL Linux MIDI drivers for Hercules DJ midi controller devices"
HOMEPAGE="http://ts.hercules.com/eng/index.php?pg=view_files&gid=2&fid=28&pid=215&cid=1"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

BUILD_TARGETS="clean modules"
MODULE_NAMES="hdj_mod()"

pkg_setup () {
	BUILD_PARAMS="KERN_DIR=\"${KV_DIR}\" KERNOUT=\"${KV_OUT_DIR}\""
	CONFIG_CHECK="SND_RAWMIDI SND_VIRMIDI"
	linux-mod_pkg_setup
}

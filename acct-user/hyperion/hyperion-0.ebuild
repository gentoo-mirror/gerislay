# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for media-plugins/hyperion (daemon)"
ACCT_USER_ID=264
ACCT_USER_GROUPS=( hyperion )

acct-user_add_deps

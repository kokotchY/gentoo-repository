# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Test of an ebuild"
HOMEPAGE="http://localhost"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="bonjour X"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	elog "Test of log"
	einfo "Test of info"
}

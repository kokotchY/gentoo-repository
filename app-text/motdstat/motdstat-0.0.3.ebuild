# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Message Of The Day System Status"
HOMEPAGE="http://www.gelogic.net/?page_id=339"
SRC_URI="http://www.gelogic.net/wp-content/uploads/2013/02/MOTDstat-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-misc/openssh"
RDEPEND="${DEPEND}"
S="${WORKDIR}/MOTDstat-${PV}"

src_compile() {
	einfo "Nothing to do"
}

src_install() {
	dobin bin/motdstat
	dodir /etc/motdstat
	insinto /etc/motdstat
	#doins etc/motdstat/motdstat.conf
	#doins etc/motdstat/netservice
	#doins etc/motdstat/process
	doins etc/motdstat/*
}

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils versionator


if [[ ${PV} == "9999" ]] ; then
	ESVN_REPO_URI="http://eid-mw.googlecode.com/svn/trunk/"
	inherit subversion autotools
	SRC_URI=""
else
	MY_P="${PN}-${PV/_p/-}"
	SRC_URI="http://eid-mw.googlecode.com/files/${MY_P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
	S="${WORKDIR}/eid-mw-$(get_version_component_range 1-3)"
fi

SLOT="0"
LICENSE="GPL-3"
DESCRIPTION="Belgian Electronic Identity Card middleware supplied by the Belgian
Federal Government."

HOMEPAGE="http://code.google.com/p/eid-mw"

IUSE="+dialogs +xpi"

RDEPEND="x11-libs/gtk+:2
	>=sys-apps/pcsc-lite-1.2.9
	>=dev-libs/openssl-0.9.7
	!app-misc/beid-runtime"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"


src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		subversion_src_unpack
		eautoreconf || die "autoreconf failed"
	else
		unpack ${A}
	fi
}

src_compile() {
	econf $(! use dialogs && echo --enable-dialogs=no) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
	! use xpi && rm -r ${D}/usr/share
}


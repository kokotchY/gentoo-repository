# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PV="${PV/_p/-}"
MY_PN="${PN/-bin}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="0"
LICENSE="LGPL-3"
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Graphical interface to the Belgian Electronic Identity Card."

SRC_URI="http://eid-viewer.googlecode.com/files/${MY_P}.zip"
HOMEPAGE="http://code.google.com/p/eid-viewer/"

RDEPEND="
	virtual/jre
	sys-apps/pcsc-lite"
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}/${MY_PN}"

IUSE=""

src_install() {
	# Remove useless windows .exe files
	find "${S}" -name '*.exe' -delete

	dodoc README.txt
	rm README.txt

	declare VIEWER_HOME=/opt/${MY_PN}

	# Install icon and .desktop for menu entry
	newicon "${FILESDIR}"/eid-viewer.png eid-viewer.png
	domenu "${FILESDIR}"/${PN}.desktop

	# Install eid-viewer in /opt
	dodir ${VIEWER_HOME%/*}
	mv "${S}" "${D}"${VIEWER_HOME}

	# Create /usr/bin/eid-viewer-bin
	dosym ${VIEWER_HOME}/eid-viewer.sh /usr/bin/eid-viewer-bin || die
}

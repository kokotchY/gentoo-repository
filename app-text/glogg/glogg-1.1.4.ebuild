# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Log parser"
HOMEPAGE="http://bonnefon.org/"
SRC_URI="http://glogg.bonnefon.org/files/glogg-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-markdown"

DEPEND=">=dev-qt/qtcore-5.2
		dev-libs/boost"
RDEPEND="${DEPEND}"

src_configure() {
	qmake
}

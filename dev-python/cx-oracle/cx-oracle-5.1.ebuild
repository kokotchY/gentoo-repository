# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_MULTIPLE_ABIS="1"
PYTHON_MODNAME="cx_Oracle"
PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1

MY_PN=$PYTHON_MODNAME
MY_P=${MY_PN}-${PV}
DESCRIPTION="Python interface to Oracle"
HOMEPAGE="http://www.cxtools.net/default.aspx?nav=cxorlb"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="Computronix"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples"

ORACLE_VERSION="11.2.0.4"

DEPEND="=dev-db/oracle-instantclient-basic-${ORACLE_VERSION}"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

DOCS="README.txt HISTORY.txt"

set_global_options() {
	export ORACLE_HOME="/usr/lib64/oracle/${ORACLE_VERSION}/client"
}

distutils_src_compile_pre_hook() {
	set_global_options
}

distutils_src_install_pre_hook() {
	set_global_options
}

pkg_postinst() {
	return
	# no python_mod_optimize
}

src_install() {
	distutils_src_install
	if use doc; then
		dohtml -r html/* || die
	fi
	if use examples; then
		docinto examples
		dodoc samples/* || die
	fi
}

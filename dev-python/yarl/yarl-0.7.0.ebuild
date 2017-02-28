# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1

DESCRIPTION="Yet another URL library"
HOMEPAGE="https://github.com/aio-libs/yarl/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-python/pytest-runner[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	# pytest-runner is not really required unless tests are enabled
	sed -e "s:'pytest-runner',\\?::" -i setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test || die
}

# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="ccls, which originates from cquery, is a C/C++/Objective-C language server."
HOMEPAGE="https://github.com/MaskRay/ccls"

# EGIT_REPO_URI="https://github.com/cquery-project/cquery"
# EGIT_COMMIT="9494c3e63be2d5b7e7740917db3c207f43031c15"
# the source tarball doesn't contain the 3rdparty folder
SRC_URI="https://github.com/MaskRay/ccls/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-devel/clang:=
		dev-libs/rapidjson"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSYSTEM_CLANG=ON
		-DCMAKE_PREFIX_PATH="/usr/lib/llvm/7"
	)
	cmake-utils_src_configure
}

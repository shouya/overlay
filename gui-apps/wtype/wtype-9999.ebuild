EAPI=8

inherit meson git-r3

DESCRIPTION="xdotool type for wayland"
HOMEPAGE="https://github.com/atx/wtype"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/atx/wtype.git"

if [[ ${PV} == 9999 ]]; then
  EGIT_BRANCH=master
else
  EGIT_COMMIT="v${PV}"
fi

KEYWORDS=""
IUSE=""
SLOT="0"

RDEPENDS="
  dev-libs/wayland
  x11-libs/libxkbcommon
"

src_configure() {
  meson_src_configure
}

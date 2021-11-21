EAPI=8

inherit meson git-r3

DESCRIPTION="Utility for miscellaneous wlroots extensions"
HOMEPAGE="https://git.sr.ht/~brocellous/wlrctl"
LICENSE="MIT"

EGIT_REPO_URI="https://git.sr.ht/~brocellous/wlrctl"

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

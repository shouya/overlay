# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="https://apps.ankiweb.net"
SRC_URI="https://apps.ankiweb.net/downloads/archive/anki-${PV}-linux.tar.bz2"

S="${WORKDIR}/anki-${PV}-linux"

LICENSE="AGPL-3+ BSD MIT GPL-3+ CC-BY-SA-3.0 Apache-2.0 CC-BY-2.5"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="configure compile"

IUSE="mpv"

RDEPEND="
  dev-qt/qtgui
  sys-libs/readline
  mpv? ( media-video/mpv )
"

src_install() {
  doman anki.1

  newbin "${FILESDIR}/anki-bin.sh" "${PN}"

  sed -i \
	  -e "s:@APP_NAME@:${P}:" \
	  "${ED}/usr/bin/${PN}"

  domenu anki.desktop
  doicon anki.png

  dodoc README

  dodir "/opt/${P}"
  cp -r bin/* "${D}/opt/${P}"
}

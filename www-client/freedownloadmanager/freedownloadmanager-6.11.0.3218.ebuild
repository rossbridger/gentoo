# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop pax-utils unpacker xdg

DESCRIPTION="A powerful modern download accelerator and organizer"
HOMEPAGE="https://www.freedownloadmanager.org"
SRC_URI="https://debrepo.freedownloadmanager.org/pool/main/f/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist strip"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	pax-mark m opt/freedownloadmanager/fdm
	mv usr/share/appdata usr/share/metainfo

	sed -i "s/^Icon=.*$/Icon=${PN}/" usr/share/applications/${PN}.desktop

	mv * "${D}" || die

	for size in 16 24 32 48 64 128 256 ; do
		newicon -s ${size} "${D}/opt/freedownloadmanager/icon.png" ${PN}.png
	done
}

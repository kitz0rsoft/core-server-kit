# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v34.0.2/wasmtime-v34.0.2-src.tar.gz -> wasmtime-v34.0.2-src.tar.gz
https://regen.mordor/1c/fd/65/1cfd65c68869d783443b1b8266d5844a44c9cbc433c64a604b362aa76cbb372344bbca22f695429f79ffe17b340d1782294ed24b579ea67baf5207cfd621778c -> wasmtime-34.0.2-funtoo-crates-bundle-fee97b1fb00407b4cb8ccde2def23ab7e331025a1f28c8ad6b20dc0547ddba69e663d4156a245bc5fa3a0547731bdbd7087b6459259bd86046f1c2c92aa30c43.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( ADOPTERS.md README.md RELEASES.md )

QA_FLAGS_IGNORED="/usr/bin/wasmtime"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/wasmtime-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}
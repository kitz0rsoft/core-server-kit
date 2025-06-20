# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v34.0.0/wasmtime-v34.0.0-src.tar.gz -> wasmtime-v34.0.0-src.tar.gz
https://regen.mordor/60/f9/53/60f95320ba3d87f0c39aa997e7678acf20f75f561055c3a1a5eef438c340602c858c898aa7f67bafab326452e021f4efc2c97389612bcffb26b50a3ddc1eeebf -> wasmtime-34.0.0-funtoo-crates-bundle-fee97b1fb00407b4cb8ccde2def23ab7e331025a1f28c8ad6b20dc0547ddba69e663d4156a245bc5fa3a0547731bdbd7087b6459259bd86046f1c2c92aa30c43.tar.gz"

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
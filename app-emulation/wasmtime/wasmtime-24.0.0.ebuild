# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v24.0.0/wasmtime-v24.0.0-src.tar.gz -> wasmtime-v24.0.0-src.tar.gz
https://regen.mordor/6f/ca/43/6fca43bede0db89506ce77437aad56ef2f247821e361736f215f8e02e8616b54294a94cec161fe02d40284493c3885ac6101e1d18e1d43b4125e33a31ab185de -> wasmtime-24.0.0-funtoo-crates-bundle-723f9d48cc8e5fa0e25dfa28debc00d3830782a83ba33ca618f62cac09af3e0f124b96ba324855f82dce2f2c317d907f779859b970c834846a45f228afa6bdc1.tar.gz"

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
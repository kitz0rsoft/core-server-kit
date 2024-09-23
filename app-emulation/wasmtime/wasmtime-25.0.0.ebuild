# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v25.0.0/wasmtime-v25.0.0-src.tar.gz -> wasmtime-v25.0.0-src.tar.gz
https://regen.mordor/39/c5/39/39c539068456150e107fd862e735565cfe0438777333db7ff44accf044eb2a0085bec2d2ffb8c82caae4bf59d8a8d4424efe0216a6f1f54b91e56cba46142f1f -> wasmtime-25.0.0-funtoo-crates-bundle-eed1ba41907e09ebf84c56d34e282b45d32a1f20af045f9573df9c05198a34e4f83b356bbf56e462130336a6c58078d03ea6081b21d5b703da83b711702cc72d.tar.gz"

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
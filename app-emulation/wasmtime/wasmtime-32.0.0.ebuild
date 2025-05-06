# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v32.0.0/wasmtime-v32.0.0-src.tar.gz -> wasmtime-v32.0.0-src.tar.gz
https://distfiles.macaronios.org/4a/b0/17/4ab01743663fc55efcd4c7bbccbc91c85e57d52fe697949ece3b0565cd5ec639e85c512e14125962077c66cc70959537935b1e060abe4257b834671a78e33267 -> wasmtime-32.0.0-funtoo-crates-bundle-8c1851d888b65d6b15bae6fd703a590fb28523f13054a3eb1fdcf164ea704ecadf1f69576f7ffe434e4e6aa24c75da834542e39199fdfa1ff0f182018c3ad1ad.tar.gz"

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
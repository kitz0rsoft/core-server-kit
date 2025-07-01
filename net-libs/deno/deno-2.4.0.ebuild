# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/45dfae18eec45c91146231aa05f4b249378691b5 -> deno-2.4.0-45dfae1.tar.gz
https://regen.mordor/f9/e5/59/f9e559b8454c4d7699b8f6dc7a817546bd4cbe9c73b87c91d2919eece5c5a75ab3d0237784fe0c81fa8edb76963f3a55303311097af868857e6a79e5d5312671 -> deno-2.4.0-funtoo-crates-bundle-fa30abacb24b68663c7d193bfac4a670b48d19bb169f35db70ff3c4b294014c49ed20747e97da9280358252ada8700f107726f427503062b24c73c711e23b0ad.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="*"

BDEPEND="
	sys-devel/llvm:*
	sys-devel/clang:*
	sys-devel/lld:*
	dev-util/gn
	virtual/rust
"

RESTRICT="network-sandbox"

S="${WORKDIR}/denoland-deno-45dfae1"

src_unpack() {
	cargo_src_unpack
}

src_compile() {
	# Don't try to fetch prebuilt V8, build it instead
	export V8_FROM_SOURCE=1
    cargo_src_compile
}

src_install() {
	# Install the binary directly, cargo install doesn't work on workspaces
	dobin target/release/deno

	dodoc -r docs
}
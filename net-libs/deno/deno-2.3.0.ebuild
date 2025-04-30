# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/61574bb9c9c255d5c661add6c7464af30475c197 -> deno-2.3.0-61574bb.tar.gz
https://regen.mordor/b4/01/6a/b4016a2d36dd5e0ad8700be39a314d92111afc51b6283903c849ad18af2f4a49c50850b03cc780f445e5b0d5fb662ac8a0199073ddf97fa9a90f691a4eccf426 -> deno-2.3.0-funtoo-crates-bundle-8cc0ba2239f56dc33b030c204ccb451dd42d4dc0bdf223e053f15a49632b43940987e03087084d679d069941d0e1d6456b278e861a42fc583bf165ad804c346d.tar.gz"
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

S="${WORKDIR}/denoland-deno-61574bb"

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
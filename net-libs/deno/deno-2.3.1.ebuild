# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8773b5f5b074e1e374a403d05943b6a7bbbdebad -> deno-2.3.1-8773b5f.tar.gz
https://distfiles.macaronios.org/ce/b1/0a/ceb10aaa104507b4048fa7a80b284f08e6586ed4c0531c9a4a8707c6cda5b85570fc87070d6b04847b750caf91d23b5cb5ecd7127fe2ccc46b32c38b8605c0bd -> deno-2.3.1-funtoo-crates-bundle-8cc0ba2239f56dc33b030c204ccb451dd42d4dc0bdf223e053f15a49632b43940987e03087084d679d069941d0e1d6456b278e861a42fc583bf165ad804c346d.tar.gz"
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

S="${WORKDIR}/denoland-deno-8773b5f"

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
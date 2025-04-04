# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/e7dab411533fd7240fd794398ba9d9590e28f69d -> deno-2.2.7-e7dab41.tar.gz
https://regen.mordor/93/88/4f/93884fa3727ef5b1c018df9d1cf545dee8ce171ac0ae6159fc4b199c44fac9b7fd0d7776d4a2354a5d1fe15b9cbe76503a869a009c9e8c22a84b57d29c871099 -> deno-2.2.7-funtoo-crates-bundle-2526605765230d16d7905c48b9e039520ce1650ac6e2e11298a04a729c0a9d5366b0806145326638f4fd3aaabcbf196af617d53d3ff6e6af7d0ba7785d2ebdd0.tar.gz"
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

S="${WORKDIR}/denoland-deno-e7dab41"

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
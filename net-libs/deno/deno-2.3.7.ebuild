# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/0d76cd50af2b21e0ac772bb5219199e32a8f312d -> deno-2.3.7-0d76cd5.tar.gz
https://regen.mordor/5b/5c/9e/5b5c9eeca059d8d548150ebcebc2a4c3b0c7fc25027c84114327d95db9638187b8915eeb78346b40f6e8708975f83d9fe7a434d44b365fb22be111c3595425a6 -> deno-2.3.7-funtoo-crates-bundle-796b6823c41de32961e8cc4bcc1e01cb0722a959444ab47c5f63bc8a7a6388115fafbcafd3761bc4eecf6154025134d91e61988b8c1d98eb966208cf46086a41.tar.gz"
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

S="${WORKDIR}/denoland-deno-0d76cd5"

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
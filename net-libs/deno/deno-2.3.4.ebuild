# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/37ba6223b6733c4b18d4727c23f6831558c0ccc8 -> deno-2.3.4-37ba622.tar.gz
https://regen.mordor/ca/50/b4/ca50b4e96eb102c9c529b9065ee853e01a9a445a5ebf69869c34d2058790b349d0434ce55088e2501cef2f6d245c440a9eb83696e32719b81167a8dbc3b4c2e1 -> deno-2.3.4-funtoo-crates-bundle-43943bcc0c7085c5c24a39cf580f2652f94d23f02a21ddc0716b8780aa2643d6011ad69082df7ecfec826391c154a40dda983cda8a33fa6255b9c72560fef89d.tar.gz"
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

S="${WORKDIR}/denoland-deno-37ba622"

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
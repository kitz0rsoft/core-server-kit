# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/81da8139af85a0cb7efa9050ae6b5461b3614077 -> deno-2.2.12-81da813.tar.gz
https://regen.mordor/44/ba/8f/44ba8fd99f1f9d90215c31998f9f8e17256c7157c21aa3494a266cc7f1e2a0bd1067b22fea058ae2a702d59cdeea94e5e4e4d5adee5683fe9f29ed93ceae2a92 -> deno-2.2.12-funtoo-crates-bundle-241c2f2d9a0f9dff09eb1d572b2414d3f6ee57989917127f3b124ff6a4f90d242ecf5ccd86b030fc0eb029043fad8d540b52ff6454a6ac63c889bb353456cf89.tar.gz"
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

S="${WORKDIR}/denoland-deno-81da813"

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
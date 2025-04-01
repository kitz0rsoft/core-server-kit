# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/2037200c4bc903162cd16b71b2564ab5bcd0601e -> deno-2.2.6-2037200.tar.gz
https://regen.mordor/08/93/95/089395ea446a5e927667a89b3c49e46395966fdffbdee31aa76f911eb5d85c4d41f8beaf119794b29bee3c34fd7921aaf0c53569eb1e1e4f6298fe20d6bc5a73 -> deno-2.2.6-funtoo-crates-bundle-a3e67b7cec010d0197485df5a99b2e268abe42a1536978884d0184109efcba56ac881aea314b4aff71b7dc0f344e781405dfbc5265771f27db27d709f340c231.tar.gz"
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

S="${WORKDIR}/denoland-deno-2037200"

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
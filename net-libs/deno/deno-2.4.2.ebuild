# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/622c3513936c1614ee316516a31343729c3c4367 -> deno-2.4.2-622c351.tar.gz
https://regen.mordor/6e/ee/eb/6eeeebea0111883991965bcd5d673fcf464239ecd7fc13c747172abfb2caa99f9ae9e62b04b240b8ff309fce625af657b0409046020fc36f8dc5b1b16818fc93 -> deno-2.4.2-funtoo-crates-bundle-ec21699d761fc37ebc731cabcdb08af17e9a41740a1ef8ef627ae97596ed0a98f6db806452db3fd2ae213b09ceb8b74e43b52a5734b4f812362ec06ae1ea50d7.tar.gz"
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

S="${WORKDIR}/denoland-deno-622c351"

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
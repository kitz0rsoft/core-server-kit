# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/c03199ea1e4e22d44aad0deafc634be82e5b841b -> deno-2.4.1-c03199e.tar.gz
https://regen.mordor/e1/fa/49/e1fa4992d4369d207d0d967b5b6b310d94a0c010c87d5a448988de10106e644329d404a8c19648a0cd84d7ef2f6d8ee1b2cd3bd342ae16d0c3531c8ef1877e07 -> deno-2.4.1-funtoo-crates-bundle-d1eff59e2318fb3582fc11d23a003b8e61d4d2887f01376194864d3614cb6c8404a26897d0f2c086b753a0e1237cb10b45afdd72f4f8977ea1e06cf02cb81f44.tar.gz"
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

S="${WORKDIR}/denoland-deno-c03199e"

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
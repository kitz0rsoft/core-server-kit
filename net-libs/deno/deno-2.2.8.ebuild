# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/32b9cc91d8c343bdec2ddcf3cedb27b5efc2f5e4 -> deno-2.2.8-32b9cc9.tar.gz
https://regen.mordor/39/0f/60/390f60e5b3a1546210be05ad0eb711477154c78a0ecf93ee987697ec9bfead17395b7a60001775d1a2493a74c0e187da087808f58f6d364483f1ce8339068b23 -> deno-2.2.8-funtoo-crates-bundle-315afcf6c9287d18882e91fc6f684f420857d8483412bbb7381c006facf22d569ee9c0a0ea8209ee8868b239d613d395ab1cdd02b3717fd5394d44091f8719ff.tar.gz"
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

S="${WORKDIR}/denoland-deno-32b9cc9"

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
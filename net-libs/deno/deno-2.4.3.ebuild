# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/5612d2edc7262d7bfb3bcfb0f18649b01ec94b53 -> deno-2.4.3-5612d2e.tar.gz
https://regen.mordor/b7/d7/39/b7d739a845f0c66c4a1af776d5231de38c4cf337e0ceca0fc2cca777399896f798f90af4468e4cdb6e35acc2c6733250b9dd033305ba67ebe0b1fd724a8ff056 -> deno-2.4.3-funtoo-crates-bundle-43c3aa5a1d703b61bf9efcefc29cbc414624797fe43ce63a7d35a2e359ea02c07202fd27ee1b735bc772c62ab3564575530767492e9a1e1991592044e2c033b1.tar.gz"
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

S="${WORKDIR}/denoland-deno-5612d2e"

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
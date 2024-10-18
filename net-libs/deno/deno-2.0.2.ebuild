# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/22a79ea420e67e783d996d5d1d64983192cb3dd8 -> deno-2.0.2-22a79ea.tar.gz
https://regen.mordor/84/45/3a/84453ac66c66330eee4776214a0a59fa81b7e53d9788a26dd60438b4006502d10908f48555d7afcaa4b214ac0ed043dd38c144a4f4af2e1b7f23e76d5849d286 -> deno-2.0.2-funtoo-crates-bundle-f2efeef38df1db29440a49f1ac091042e3156c6799f1baba5131a9dcbc2b1ac5a7169424e230e7e950e17fc1bd74b489f23ea9069455d72fad156cd2d76b90e0.tar.gz"

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

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/denoland-deno-* ${S} || die
}

src_compile() {
	# Don't try to fetch prebuilt V8, build it instead
	export V8_FROM_SOURCE=1

	# Resolves to /usr/lib64/llvm/<version>
	export CLANG_BASE_PATH="$(readlink -f -- "$(dirname -- $(clang --print-prog-name=clang))/..")"

	cargo_src_compile
}

src_install() {
	# Install the binary directly, cargo install doesn't work on workspaces
	dobin target/release/deno

	dodoc -r docs
}
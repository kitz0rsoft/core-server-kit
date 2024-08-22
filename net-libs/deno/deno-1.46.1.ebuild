# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/de11ff8c556c6922f832f639f54e5f7a6a3096b9 -> deno-1.46.1-de11ff8.tar.gz
https://regen.mordor/04/54/7b/04547ba9e2f212c7050428c6340440cbbe265a3734453442e53c2f7b6485b61a855b2169f80f8e7371f15beeb484c8ac21dee173890ef63b9e433f3f3f34ab8d -> deno-1.46.1-funtoo-crates-bundle-ab5b9672c19ff90c34fd74bd67f3a9bacfa69101525adaca199d10f6bb4e8c09f53c352a1ffb22d5657701a0e06df2ca5264d6281075a1ea5edd3936fc548735.tar.gz"

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
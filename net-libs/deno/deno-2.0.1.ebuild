# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/99c2aa573057e337f3474d43a7aab8c5e6b4caa2 -> deno-2.0.1-99c2aa5.tar.gz
https://regen.mordor/68/7b/da/687bdaff0e32592a57e9f63321f4fff03e27a62015f9ecb228f0174113a41bbe31b8ec5b97dfb75f9c29cd8a09af5e57d71d060bc2c67ad7430dc2a1245d6b3d -> deno-2.0.1-funtoo-crates-bundle-bb227dc96cf34309d7889a47a24594adb70faf8940d249dba5202c54038939de4dd3057b804ee7ee4a733772e87baa1771950bee1886431313c1d4987362a5b3.tar.gz"

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
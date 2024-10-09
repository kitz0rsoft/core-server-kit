# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/a62c7e036ab6851c0293f407ead635a7331445b7 -> deno-2.0.0-a62c7e0.tar.gz
https://regen.mordor/f9/97/a8/f997a832bb7da3e4a7349a380f72a1ad48dd0dea6f5bd5c3ea2b0e69a52bd5e54f363f6a3c6313c2da5fed285d4d2a8108bca0bd1424c456cb6643340f74ede9 -> deno-2.0.0-funtoo-crates-bundle-977610e25099f27b74161f3b0be73093fb7b005efe0c4286bb7cbd1cf0032bbcd46893516d73e48d5e2e6319ef28f5f342457b6aab5fd74856b87ad602c3970c.tar.gz"

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
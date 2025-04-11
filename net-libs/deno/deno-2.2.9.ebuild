# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Deno is a simple, modern and secure runtime for JavaScript and TypeScript"
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/25defa74d539d1d6fd27ddabd5260705677c43e8 -> deno-2.2.9-25defa7.tar.gz
https://regen.mordor/e7/62/84/e7628458fb9ff94653bd84e5c354787aff24055151cfd4182497072b9906f277cc414ff9073a073e997eec3ee0093c43dac3c3371de9294bd5d46558fe2adaa5 -> deno-2.2.9-funtoo-crates-bundle-fa12c78208d1d8b476c3f9b751ce8b883bcc79007058912f62c9793be7d73040db9146b5fc1420e9826dfc241aafd32d2551eb65500bd5fc66afe3727893d4c3.tar.gz"
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

S="${WORKDIR}/denoland-deno-25defa7"

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
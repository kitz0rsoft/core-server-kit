# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="version"

DESCRIPTION="Helps with managing the version number of Git-hosted PHP projects"
HOMEPAGE="https://phpunit.de"
SRC_URI="https://github.com/sebastianbergmann/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="dev-php/fedora-autoloader
	>=dev-lang/php-7.3:*"

src_install() {
	insinto /usr/share/php/SebastianBergmann
	doins src/Version.php
	insinto /usr/share/php/SebastianBergmann/Version
	doins "${FILESDIR}/autoload.php"
}

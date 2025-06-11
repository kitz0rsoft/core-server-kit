# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

SRC_URI="https://files.pythonhosted.org/packages/fa/24/ca5a4acf4e029632d396fe92d015711f5bda0cc164e65cc91f4ac5210518/certbot_dns_route53-4.1.0.tar.gz -> certbot_dns_route53-4.1.0.tar.gz"
KEYWORDS="*"

inherit distutils-r1

DESCRIPTION="Route53 plugin for certbot"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND=">=dev-python/setuptools-1.0[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	>=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/acme-0.29.0[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"
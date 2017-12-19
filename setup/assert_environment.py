from __future__ import print_function
import argparse
import cryptography
import OpenSSL
import OpenSSL.SSL
from cryptography.hazmat.bindings import _openssl
from packaging.requirements import Requirement
from packaging.version import Version


opensslSO = _openssl.__file__


def makeAssertions():
    parser = argparse.ArgumentParser(
        description="Make assertions about the build environment.")
    parser.add_argument("openssl")
    parser.add_argument("cryptography")
    parser.add_argument("pyopenssl")
    args = parser.parse_args()

    majorMinorFix = OpenSSL.SSL.OPENSSL_VERSION_NUMBER & 0xFFFFF000
    if majorMinorFix != int(args.openssl, 16):
        raise AssertionError("OpenSSL version {}, expected {}".format(
            hex(majorMinorFix), args.openssl))

    cryptographyVersions = Requirement(args.cryptography).specifier
    pyOpenSSLVersions = Requirement(args.pyopenssl).specifier

    if Version(cryptography.__version__) not in cryptographyVersions:
        raise AssertionError(
            "cryptography version {} conflicts with {!r}".format(
                cryptography.__version__, cryptographyVersions))

    if Version(OpenSSL.__version__) not in pyOpenSSLVersions:
        raise AssertionError(
            "pyOpenSSL version {} conflicts with {!r}".format(
                OpenSSL.__version__, pyOpenSSLVersions))

    print("OpenSSL version".ljust(30, '.'), hex(majorMinorFix))
    print("cryptography version".ljust(30, '.'), cryptography.__version__)
    print("pyOpenSSL version".ljust(30, '.'), OpenSSL.__version__)


makeAssertions()

# Test environments for http://twistedmatrix.com/trac/ticket/9210.

## Overview

There are two sets of services defined in `docker-compose.yml`:

1. `trial` - these run `trial twisted.test.test_sslverify` against
   different versions of OpenSSL, collecting coverage in `coverage/`.
   **These services should all run successfully**
2. `sanity` - these run the reproducing script from
   http://twistedmatrix.com/trac/ticket/9210 (`sanity/bug.py`) against
   different versions of OpenSSL.  **Only OpenSSL 1.1.0 will run
   successfully.  This includes `sanity-debian9` which runs the
   reproducing script against Debian 9 as described in the ticket,
   demonstrating the effectiveness of the patch.

Here's an overview of the dependencies:

| OpenSSL | EC/ECDH | Origin         | `pyOpenSSL` | `cryptography` | Base image              |
|---------|---------|----------------|-------------|----------------|-------------------------|
| 1.0.1u  | No      | Source         | 16.2.0      | 1.7            | `python:2.7.14-jessie`  |
| 1.0.1u  | Yes     | Source         | 16.2.0      | latest         | `python:2.7.14-jessie`  |
| 1.0.2n  | Yes     | Source         | 16.2.0      | latest         | `python:2.7.14-jessie`  |
| 1.1.0f  | Yes     | System package | 16.2.0      | latest         | `python:2.7.14-stretch` |

OpenSSL 1.0.1u and 1.0.2f are the latest released versions for their
respective branches, while 1.1.0f is the version included with
`stretch`, and mentioned in this report.  `jessie` includes OpenSSL
1.0.0, so 1.0.1 and 1.0.2 had to be built from source.

`pyOpenSSL` 16.2.0 was chosen because that is the version included
with `stretch`, and the earliest that Twisted seems to actually
support.

`cryptography` 1.7 was chosen for the OpenSSL 1.0.1 installation
without EC and ECDH because it's the latest version that seems to
build against OpenSSLs without EC support.

## Coverage

Run each `trial` environment like this:

```
docker-compose -e TWISTED_CHECKOUT=/path/to/twisted/checkout run trial-debian9
```

Where `/path/to/twisted/checkout` is the path to your Twisted Git checkout.

Coverage lands in `coverage/`.  Symlink in the `src` directory from a
Twisted checkout there, then combine and report.  The symlinking is
redundant but necessary, because
the
[first `path` must refer to an actual path](http://coverage.readthedocs.io/en/coverage-4.4.2/config.html#paths),
and the symlink couldn't be followed out of a Docker container.

## Sanity

Run each `trial` environment like this:

```
docker-compose -e TWISTED_CHECKOUT=/path/to/twisted/checkout run sanity-debian9
```

The final log lines and exit codes will indicate success or failure:

```
...
sanity-debian9_1              | Response received
sanity-debian9_1              | None
twistedopenssltests_sanity-debian9_1 exited with code 0
```

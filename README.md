Test environments for http://twistedmatrix.com/trac/ticket/9210.

Run like this:

```
docker compose-up --build --force-recreate
```

Coverage lands in `coverage/`.  Symlink in the `src` directory from a
Twisted checkout there, then combine and report.


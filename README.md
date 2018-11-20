# elm-maker

This is a simple elm container based on `node:10-slim` with https://github.com/obmarg/libsysconfcpus.git bundled in.

## Why?

https://github.com/elm/compiler/issues/1473#issuecomment-245704142

## Usage

#### Without sysconfcpus
```bash
docker run -it --rm \
    -v $(pwd):/workspace \
    coyainsure/elm-make \
    yarn
```

#### With sysconfcpus
```bash
docker run -it --rm \
    -v $(pwd):/workspace \
    coyainsure/elm-make \
    "sysconfcpus -n 2 yarn"
```

## LICENSE
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

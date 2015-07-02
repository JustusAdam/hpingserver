# hpingserver

Intended for those who are as impatient as I am when the internet goes down, or a server goes offline.

This small program will repeatedly try to connect to a url until the connection is successful.

## Installation

- clone the repository
- `cabal install`

## Usage

Use `hpingserver -h` to see all available options.

Current output of `hpingserver -h`:

    Help Options:
      -h, --help
        Show option summary.
      --help-all
        Show all help options.

    Application Options:
      -d, --delayy :: int
        How long to wait between requests (seconds)
        default: 30

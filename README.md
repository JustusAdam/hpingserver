# hpingserver

Intended for those who are as impatient as I am when the internet goes down, or a server goes offline.

This small program will repeatedly try to connect to a url until the connection is successful.

## Installation

- clone the repository
- execute `cabal install` in the repository root directory.

The program is now reachable with the `hpingserver` command.

## Usage

Basic: `hpingserver [OPTIONS] URL`

Use `hpingserver -h` to see all available OPTIONS.

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

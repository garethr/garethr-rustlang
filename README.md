Puppet module for installing Rust from [a
PPA](https://launchpad.net/~hansjorg/+archive/rust).

This module is also available on the [Puppet
Forge](https://forge.puppetlabs.com/garethr/rustlang)

[![Build Status](https://secure.travis-ci.org/garethr/garethr-rustlang.png)](http://travis-ci.org/garethr/garethr-rustlang)

## Usage

The module includes a single class:

    include 'rustlang'

By default this sets up the PPA and installs the rust-0.8 package.
See the code for ways to get rust-nightly or other versions.

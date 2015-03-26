[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/noamross/upipe.svg?branch=master)](https://travis-ci.org/noamross/upipe)
[![Coverage Status](https://coveralls.io/repos/noamross/upipe/badge.svg)](https://coveralls.io/r/noamross/upipe)
# Merging *NIX and magrittr pipelines

`upipe()` is a modification of R's `system()` command designed for integration
into magrittr / dplyr pipelines.

## Install

```
install.packages(devtools)
install_github('noamross/upipe')
```

## Usage

```
library(upipe)
list.files() %>% upipe('grep R')
```

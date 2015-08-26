[![Project Status: Wip - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/noamross/upipe.svg?branch=master)](https://travis-ci.org/noamross/upipe)
[![Coverage Status](https://coveralls.io/repos/noamross/upipe/badge.svg)](https://coveralls.io/r/noamross/upipe)
[![Join the chat at https://gitter.im/noamross/upipe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/noamross/upipe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Merging *NIX and magrittr pipelines

`upipe()` is a modification of R's `system()` command designed for integration
into magrittr / dplyr pipelines. 


## Install

```
install.packages('devtools')
install_github('noamross/upipe')
```

## Usage

```
library(upipe)
upipe(list.files(), 'grep R')
list.files() %>% upipe('grep R')
```

upipe has methods for specific object types. By default, it converts inputs
to chracter.  It converts data.frames to CSV.

```
mtcars %>% upipe('grep Toyota')
1:30 %>% upipe('grep 3')
```

Suggestions and contributions for other methods [are welcome](https://github.com/noamross/upipe/issues/1).


## Thanks

- [Vince Buffalo](https://github.com/vsbuffalo) for the concept and name

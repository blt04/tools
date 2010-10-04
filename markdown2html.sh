#!/bin/bash
#
# Wrapper for markdown that creates a full HTML page with default
# CSS styling
#
# Usage:
#   See markdown docs
#
#
# ---------------------------------------------------------------------------
#
# LICENSE
# Copyright (c) 2010, Brandon Turner
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the name "markdown2html" nor the names of its contributors may
#   be used to endorse or promote products derived from this software
#   without specific prior written permission.
#
# This software is provided by the copyright holders and contributors "as
# is" and any express or implied warranties, including, but not limited
# to, the implied warranties of merchantability and fitness for a
# particular purpose are disclaimed. In no event shall the copyright owner
# or contributors be liable for any direct, indirect, incidental, special,
# exemplary, or consequential damages (including, but not limited to,
# procurement of substitute goods or services; loss of use, data, or
# profits; or business interruption) however caused and on any theory of
# liability, whether in contract, strict liability, or tort (including
# negligence or otherwise) arising in any way out of the use of this
# software, even if advised of the possibility of such damage.
#

DEFAULT_TITLE=$(basename $1 ".markdown")
TITLE=${TITLE:-$DEFAULT_TITLE}

cat <<EndOfHeader
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${TITLE}</title>
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.2.0/build/cssbase/base-min.css">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.2.0/build/cssfonts/fonts-min.css">
    <style type="text/css" media="all">
      body { background-color: #EEE; margin: 0 15px; }
      #page {
        max-width: 960px;
        background-color: white;
        margin: 2em auto;
        padding: 1em 2em 2em 2em;
        -moz-box-shadow: 5px 5px 10px #AAA;
        -webkit-box-shadow: 5px 5px 10px #AAA;
        box-shadow: 5px 5px 10px #AAA;
        border: 1px solid #999;
        -moz-border-radius: 8px;
        border-radius: 8px;
      }
      pre { color: #222; background-color: #F8F8FF; border: 1px solid #CCC; padding: 1em; font-size: 93%; overflow: auto; }
      blockquote { border-left: 5px solid #CCC; color: #222; padding-left: 0.6em; }
      code { color: #222; background-color: #F8F8FF; border: 1px solid #CCC; font-size: 93%; padding: 0 0.2em; }
      pre code { border-style: none; font-size: 100%; padding: 0; line-height: 1.5em; background-color: transparent; }
      h2 { margin-top: 1.5em; border-top: 3px solid #CCC; padding-top: 1.5em; }
    </style>
    <style type="text/css" media="print">
      body { background-color: white; }
      #page {
        width: 100%;
        border-style: none;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        margin: 0;
        padding: 0;
      }
      pre, blockquote { page-break-inside: avoid; }
      pre { overflow: visible; }
    </style>
  </head>
  <body>
    <div id="page">
EndOfHeader

/usr/bin/markdown $@

cat <<EndOfFooter
    </div>
  </body>
</html>
EndOfFooter

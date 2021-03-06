**2017 project status: The BashSupport project will only receive fixes for major problems**

*BashSupport is fully developed in my spare time since 2009. I'm unable to provide full support for BashSupport and will concentrate on fixes for major problems.*

*Please let me know if you are interested in helping with the development. I will accept pull requests.*

# About
BashSupport adds Bash language support to IntelliJ based products.
It supports IntelliJ Ultimate and Community editions, PHPStorm, WebStorm, RubyMine, PyCharm and others.

## License
BashSupport is licensed under the terms of the Apache 2.0 license.
Read the file [LICENSE.txt](LICENSE.txt) for further details.

Please see NOTICE for further details about the license and included code of other developers.

## Documentation
For now, refer to the partially outdated [Documentation](http://www.ansorg-it.com/en/products_bashsupport.html).

## Changelog
See the [Changelog](Changelog.md) for a list of the last changes in BashSupport.

# Developer information
## Bash lexer
The lexer is defined as a JFlex lexer, the definition is in the file bash.flex in the package com.ansorgit.plugins.bash.lang.lexer.
The actual lexing has to track several states, which makes the lexer definition quite difficult. There are lexer unit tests defined in the package com.ansorgit.plugins.bash.lang.lexer in the source directory "test". 

## Bash Parser
The parser is defined in com.ansorgit.plugins.bash.lang.parser and its subpackages. The entry point is the class "BashParser". The actual parsing is split into several smaller pieces. A piece usually implements the interface ParsingFunction.

Parsing Bash mostly is whitespace insensitive in most parts, but at some places the whitespace needs to be read by the parser, i.e. Bash is partly whitespace-sensitive. To achieve this a hack has been implemented (for further details see BashPsiBuilder.enableWhitespace).

Also, in Bash keywords are context-sensitive. The word if is a keyword if it's the first token on a line. If passed as parameter it's a normal word token. BashTokenRemapper remaps keywords to normal word tokens, depending on the context.

String parsing is quite adventureous in Bash. Strings can contain subshells which can contain strings (with even more nesting). So "$(echo "$a")" is a string nested inside of another string. The class "StringParsingState" is used by the lexer to track the state of string nesting.

## Bash PSI
The Bash PSI definition is in com.ansorgit.plugins.bash.lang.psi . The entry point is the class BashPsiCreator, which is used to map a AST node to a newly created PSI node.

# Tools
I'm using Yourkit to locate and fix performance issues of BashSupport. YourKit, LLC kindly provided a
free open-source license of the [YourKit Java Profiler](https://www.yourkit.com/java/profiler/index.jsp).

![YourKit Java Profiler Logo](yklogo.png "YourKit Java Profiler Logo")

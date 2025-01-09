#import "../../layouts/mainmatter-or-appendix.typ": mainmatter_or_appendix

#show: mainmatter_or_appendix.with(type: (mainmatter: false, appendix: true))

= this is a appendix

#lorem(100)

== test test test

#lorem(100)

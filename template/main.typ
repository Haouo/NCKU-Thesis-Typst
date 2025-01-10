#import "setup.typ": *

#show: whole // rules and styles which applys to the whole document

// NOTE: generate cover page
#make_cover()

// NOTE: include abstracts (english and zh-tw)
#include "contents/abstract.typ"

// NOTE: include extended abstract (english ver.)
#include "contents/extended-abstract-en.typ"

// NOTE: include acknowledgements (english and zh-tw)
#include "contents/acknowledgement.typ"

// NOTE: generate outline (includes list-of-table and list-of-figure)
#make_outline()

// NOTE: imclude mainmatter part
#include "contents/mainmatter.typ"

// NOTE: generate reference section
#make_ref(bibliography(title: "Reference", full: true, "ref.bib"))

// NOTE: include appendices
#include "contents/appendix.typ"

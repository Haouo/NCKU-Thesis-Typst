#let abstract_zh_tw(keywords: (:), it) = [
  #set align(center)
  #set heading(numbering: none, outlined: true)
  #show heading.where(level: 1): set text(21pt)
  #set par(
    leading: 1.5em,
    first-line-indent: 1em,
    linebreaks: "optimized",
  )

  = 摘要

  #v(1cm)
  #set align(left)
  #set text(size: 12pt)

  #it

  #v(0.5cm)
  #set par(first-line-indent: 0em)
  關鍵字：#keywords.join("、")

  #pagebreak()
]

#let abstract_en(keywords: (:), it) = [
  #set align(center)
  #set heading(numbering: none, outlined: true)
  #show heading.where(level: 1): set text(21pt)
  #set par(
    leading: 1.5em,
    first-line-indent: 1em,
    linebreaks: "optimized",
  )

  = Abstract

  #v(1cm)
  #set align(left)
  #set text(size: 12pt)

  #it

  #v(0.5cm)
  #set par(first-line-indent: 0em)
  Keywords: #keywords.join(", ")

  #pagebreak()
]

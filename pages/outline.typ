#let outline_of_mainmatter() = {
  set page(numbering: "i")
  counter(page).update(1)

  // text size except for outline title
  set text(size: 12pt)

  show outline: it => {
    show heading: it => {
      set text(size: 17pt)
      set align(center)
      it
      v(0.8cm)
    }
    it
  }

  // the intention of the invisible level 1 heading is to
  // make the outline itself appear on the outline
  [= Table of Content <invisible>]
  outline(
    indent: auto,
    title: [Table of Contents],
  )
  pagebreak()

  [= List of Table <invisible>]
  outline(
    indent: auto,
    title: [List of Tables],
    target: figure.where(kind: table),
  )
  pagebreak()

  [= List of Figures <invisible>]
  outline(
    indent: auto,
    title: [List of Figures],
    target: figure.where(kind: image),
  )
  pagebreak()
}


#let make_ref(ref: none) = {
  show heading.where(level: 1): it => {
    set align(center)
    set text(size: 21pt)
    it
    v(1cm)
  }
  set page(numbering: "1")

  ref
  pagebreak()
}

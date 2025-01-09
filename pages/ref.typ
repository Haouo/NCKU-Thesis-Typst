#let make_ref(file: "") = {
  assert(
    file != "",
    message: "You should specify the path to bibliography file!",
  )

  show heading.where(level: 1): it => {
    set align(center)
    set text(size: 21pt)
    it
    v(1cm)
  }
  set page(numbering: "1.")

  bibliography(file, title: "Reference", full: true)
  pagebreak()
}

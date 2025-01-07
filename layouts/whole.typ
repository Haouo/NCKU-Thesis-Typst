#let whole(it) = {
  // set the fonts of whole document
  set text(font: ("Times New Roman", "TW-MOE-Std-Kai"))

  // make objects with "invisible" lebel be hidden
  show label("invisible"): it => { }

  // display the content
  it
}

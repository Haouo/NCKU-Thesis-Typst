#let whole(
  lang_en: true,
  lang_zh_tw: false,
  it,
) = {
  // check the lang type setting
  assert(
    (
      (lang_en and (not lang_zh_tw)) or (lang_zh_tw and (not lang_en))
    ), // XOR logic
    message: "You should chose only one main language type!",
  )

  // set the fonts of whole document
  set text(
    // NOTE: "Times New Roman" as main english font
    // NOTE: "TW-MOE-Std-Kai" as main zh-tw font
    font: ("Times New Roman", "TW-MOE-Std-Kai"),
    lang: if lang_zh_tw { "zh" } else { "en" },
    region: if lang_zh_tw { "tw" } else { none },
  )

  // make objects with "invisible" lebel be hidden
  show label("invisible"): it => { }

  // display the content
  it
}

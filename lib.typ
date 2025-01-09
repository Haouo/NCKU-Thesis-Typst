#import "layouts/whole.typ": whole
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/extended-abstract-en.typ": extended_abstract_en
#import "pages/cover.typ": *
#import "pages/approved-by.typ": *
#import "pages/acknowledge.typ": *
#import "pages/abstract.typ": *
#import "pages/outline.typ": *

#let setup(
  degree: (master: true, doctor: false),
  student: (en: "", zh_tw: ""),
  advisor: (en: "", zh_tw: ""),
  coadvisor: (), // it should be a list with one or many two-key dicts which is (en: "", zh_tw: "")
  title: (en: "", zh_tw: ""),
  main_lang: (en: true, zh_tw: false),
  date: (en: "2025/01/15", zh_tw: "中華民國 114 年 1 月 15 日"),
) = {
  // todo
  // return functions the author need
  return ()
}

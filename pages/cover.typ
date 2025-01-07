#let cover(
  institute: "Department of Computer Science and Informantion Engineering",
  degree: "doctor",
  title-zh-tw: "以 Typst 撰寫之成功大學碩博士論文模板",
  title-en: "A Thesis Template written in Typst",
  student-zh-tw: "張峻豪",
  student-en: "Chun-Hao Chang",
  advisor-zh-tw: "蔡家齊 博士",
  advisor-en: "Dr. Chia-Chi Tsai",
  coadvisor-zh-tw: ("林某某 博士", "陳某某 博士", "王某某 博士"),
  coadvisor-en: ("Dr. Ha-Ha Lin", "Dr. Xiao-Xi Chen", "Dr. Po-Penn Wang"),
) = {
  // checking degree
  assert(
    ((degree == "master") or (degree == "doctor")),
    message: "Wrong degree configuration!",
  )

  // set page margin
  set page(
    paper: "a4",
    numbering: none,
    margin: (top: 23mm, bottom: 30mm, left: 20mm, right: 20mm),
    background: image("../assets/watermark-20160509_v2-a4.svg"),
  )


  // top of the cover
  align(
    top + center,
    stack(
      text(size: 25pt)[National Cheng Kung University],
      v(1cm),
      text(size: 25pt)[#institute],
      v(1cm),
      text(size: 25pt)[
        #if degree == "master" {
          [Master Thesis]
        } else {
          [Doctoral Dissertation]
        }
      ],
    ),
  )

  // title of the cover
  place(
    center + horizon,
    stack(
      text(size: 17pt)[#title-zh-tw],
      v(1.5em),
      text(size: 17pt)[#title-en],
    ),
  )

  // author info and date
  align(bottom + center)[
    // author (2 columns, zh-tw and en)
    // first column: zh-tw ver.
    #grid(
      columns: (50%, 50%),
      align: (top, top),
      stack(
        grid(
          columns: (45%, 10%, 45%),
          align: (right, center, left),
          text(size: 17pt)[學生],
          text(size: 17pt)[:],
          text(size: 17pt)[#student-zh-tw],
        ),
        v(1cm),
        grid(
          columns: (45%, 10%, 45%),
          align: (right, center, left),
          text(size: 17pt)[指導教授],
          text(size: 17pt)[:],
          text(size: 17pt)[#advisor-zh-tw],
        ),
        v(0.75cm),
        grid(
          columns: (45%, 10%, 45%),
          align: (right, center, left),
          text(size: 17pt)[共同指導教授],
          text(size: 17pt)[:],
          text(size: 17pt)[#coadvisor-zh-tw.join("\n")],
        ),
      ),
      // second column: english ver.
      stack(
        grid(
          columns: (35%, 10%, 55%),
          align: (right, center, left),
          text(size: 17pt)[Student],
          text(size: 17pt)[:],
          text(size: 17pt)[#student-en],
        ),
        v(1cm),
        grid(
          columns: (35%, 10%, 55%),
          align: (right, center, left),
          text(size: 17pt)[Advisor],
          text(size: 17pt)[:],
          text(size: 17pt)[#advisor-en],
        ),
        v(0.75cm),
        grid(
          columns: (35%, 10%, 55%),
          align: (right, center, left),
          text(size: 17pt)[Co-Advisor],
          text(size: 17pt)[:],
          text(size: 17pt)[#coadvisor-en.join("\n")],
        ),
      ),
    )
    // intentionally left vertical space
    #v(5em)
    // date
    #text(size: 17pt)[#datetime.today().display()]
  ]

  // ensure page-break
  pagebreak()
}

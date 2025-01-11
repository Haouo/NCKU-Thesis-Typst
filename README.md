# 國立成功大學 碩博士論文模板 NCKU Thesis/Dissertation Template in Typst

## Introduction

This is a typst template which can be used to write thesis/dissertation in National Cheng Kung University.

這個模板是基於 Typst 排版語言所撰寫的，主要作為[國立成功大學](https://www.ncku.edu.tw/)的碩博士畢業論文撰寫使用。

### What is Typst?

> Typst is a good choice for writing any long form text such as essays, articles, scientific papers, books, reports, and homework assignments.
> Moreover, Typst is a great fit for any documents containing mathematical notation, such as papers in the math, physics, and engineering fields.
> Finally, due to its strong styling and automation features, it is an excellent choice for any set of documents that share a common style, such as a book series.
>
> [Typst Docs](https://typst.app/docs/tutorial/)

Many of you may have heard of or even used LaTeX, the powerful and classic typesetting language. However, its complexity often discourages many from diving deeper into it.

For those who feel overwhelmed by LaTeX's intricate syntax, Typst might be a perfect alternative for you.
As a relatively young language, Typst offers a clean and concise syntax, fast compilation speed, and comprehensive documentation.
Despite its simplicity, Typst retains powerful and flexible typesetting capabilities, enabling users to achieve more than 90% of what they could typically do with LaTeX.

大家應該或多或少都有聽過或甚至是接觸過 LaTex 這個強大且經典的排版語言，但或許也有很多人被其複雜的語法所勸退。
針對這類人來說，或許你非常適合接觸 Typst。Typst 作為一門非常年輕的語言，有簡潔的語法、快速的編譯速度還有詳實的文件可以查閱。
即使語法非常簡潔，Typst 卻不失其強大且具有彈性的排版能力，利用 Typst 可以做到接近 90% 以上本來可以在 LaTex 中做到的事情。

If you’ve never worked with any markup language before, starting with Markdown might be a good idea.
It serves as an excellent introduction and will make transitioning to Typst much smoother.
For those already familiar with LaTeX, you can check out the [Typst - Guide for LaTeX Users](https://typst.app/docs/guides/guide-for-latex-users/).
If you’ve written LaTeX before, picking up Typst will feel like a piece of cake!

對於完全沒有接觸過任合標記式語言（Markup Language）的人，可以先參考看看 Markdown 這門語言，再來接觸 Typst 應該會容易很多！
而對於那些本來就會寫 LaTeX 的人，可以閱讀 [Typst - Guide for LaTeX users](https://typst.app/docs/guides/guide-for-latex-users/)，相信上手相信上手 Typst 對於寫過 LaTeX 的人來說根本就是 piece of cake。

## Acknowledgements

The completion of this template owes great gratitude to the following three projects:

本模板的完成極力感謝以下三個專案

1. [canonical-nthu-thesis](https://github.com/kotatsuyaki/canonical-nthu-thesis)
2. [ncku-thesis-template-latex](https://github.com/wengan-li/ncku-thesis-template-latex)
3. [modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis)

which provided extensive references in terms of ideas and formatting.

在想法上及格式上給予非常多參考

## How to use?

### Basic Concenpts

基本上，這個模板最基本的函數就是 `setup()`，其定義如下

```typst
#let setup(
  in-degree: (master: false, doctor: false),
  in-institute: "",
  in-student: (en: "", zh-tw: ""),
  in-advisor: (en: "", zh-tw: ""),
  in-coadvisor: (), // it should be a list with one or many two-key dicts which is (en: "", zh-tw: "")
  in-title: (en: "", zh-tw: ""),
  in-main-lang: (en: false, zh-tw: false),
  in-date: (en: "", zh-tw: ""),
) = {
  // ...
  // it will return a dict which contains many functions
}
```

使用此模板的時候，第一件事情就是先呼叫 `setup()` 來初始化整個模板，並且接收 `setup()` 回傳（return）的多個 functions，在後續撰寫論文的時候會使用到這些 functions。
具體來說，我們可以這樣做：

```typst
#let (
  make-cover,
  make-abstract-en,
  make-abstract-zh-tw,
  make-acknowledge-en,
  make-acknowledge-zh-tw,
  make-outline,
  make-ref,
  whole,
  extended-abstract-en,
  mainmatter-or-appendix,
  begin-of-roman-page-num,
  begin-of-arabic-page-num,
) = setup(
  in-degree: (master: false, doctor: true),
  in-institute: "Department of Electrical Engineering",
  in-title: (
    en: "A Thesis/Dissertation Template written in Typst for National Cheng Kung University",
    zh-tw: "以 Typst 撰寫之國立成功大學碩博士論文模板論文模板",
  ),
  in-student: (en: "Chun-Hao Chang", zh-tw: "張峻豪"),
  in-advisor: (en: "Dr. Chia-Chi Tsai", zh-tw: "蔡家齊 博士"),
  in-coadvisor: (
    (en: "Dr. Ha-Ha Lin", zh-tw: "林哈哈 博士"),
  ), // must make this argument be a array which contains one or many dict, so the trailing comma is important for the scenario with only one co-advisor
  in-main-lang: (en: true, zh-tw: false),
)
```

在呼叫 `setup()` 的時候，我們必須傳入關於本篇論文的基本資訊，如學位類別（碩士、博士）、學院、學生和指導教授姓名（中、英文）...等等，接下來 `setup()` 會回傳 **12 個** 函式，接下來撰寫整篇論文時候我們會依序使用到。

具體來說，這十二個函式的參數類別分別如下（括號中沒東西代表不必傳入參數）：

1. `make_cover()`
2. `make-abstract-en(keywords: (), doc)`
3. `make-abstract-zh-tw(keywords: (), doc)`
4. `make-acknowledge-en(doc)`
5. `make-acknowledge-zh-tw(doc)`
6. `make-outline()`
7. `make-ref(ref)`
    - 其中 `ref` 應該傳入 typst 內建的 `bibliography()` 函式呼叫。舉例來說，可以傳入 `bioliography(title: "Reference", full: false, "ref.bib")`
8. `whole(doc)`
9. `extended-abstract-en(doc)`
10. `mainmatter-or-appendix(mode: (mainmatter: false, appendix: false), doc)`
11. `begin-of-roman-page-num(doc)`
12. `being-of-arabic-page-num(doc)`

我們在接下來的章節中會看到該如何使用這些函式來撰寫我們的論文。

### `setup.typ`

為了避免 _cyclic import_ 的編譯錯誤，所以我們不能直接在 `main.typ` 中呼叫 `setup()` function，因此我們必須額外建立一個新的檔案，使其可以被 `main.typ` 和 `contents/` 資料夾底下檔案給 imported。

TODO

### `main.typ` and `contents/`

TODO

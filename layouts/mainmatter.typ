#let mainmatter(it) = {
  // Returns whether the current page has a chapter (top-level) heading.
  let is-chapter-start-page() = {
    // Find chapter headings on the current page.
    let all_level_one_heading = query(heading.where(level: 1))
    let current_page = here().page()
    return (
      all_level_one_heading
        .filter(it => {
          it.location().page() == current_page
        })
        .len()
        > 0
    )
  }

  // Set the page numbering to arabic numerals.
  //
  // Although we use custom headers and footers to display the page numbers in the body part,
  // this is still required to show the page numbers in arabic numerals in the outlines.
  set page(
    margin: (top: 23mm, bottom: 35mm, left: 30mm, right: 25mm),
    numbering: "1",
    header: context {
      if not is-chapter-start-page() {
        let level_1_heading_so_far = query(
          heading.where(level: 1).before(here()),
        )
        let current_chapter_heading = level_1_heading_so_far.last()
        let current_chapter_number = counter(heading)
          .at(current_chapter_heading.location())
          .at(0)

        smallcaps("Chapter " + str(current_chapter_number) + ".")
        h(0.75em)
        smallcaps(current_chapter_heading.body)
        h(1fr)
        counter(page).display() // page number
      }
    },
    footer: context {
      if is-chapter-start-page() {
        h(1fr)
        counter(page).display() // page number
      }
    },
  )

  counter(page).update(1)

  // set paragraph
  set par(
    leading: 1.5em,
    first-line-indent: 1em,
    linebreaks: "optimized",
  )


  set heading(numbering: "1.1.1")

  show heading: it => {
    let loc = it.location()
    let font_size = if it.level == 1 {
      18pt
    } else {
      14pt
    }
    set text(size: font_size)
    block(
      width: 100%,
      {
        let all_prev_headings = query(selector(heading).before(loc))
        if all_prev_headings.len() > 1 {
          let pre_heading = all_prev_headings.at(-2)
          let is_same_page = (
            pre_heading.location().page() == it.location().page()
          )
          let is_colse = (
            pre_heading.location().position().y + 250pt
              > it.location().position().y
          )
          let is_parent = pre_heading.level == (it.level - 1)
          if (is_same_page and is_colse and is_parent) {
            v(-1em) // make them closer
          } else {
            v(2em)
          }
        } else {
          v(1em)
        }
        set par(justify: false)
        grid(
          columns: 2,
          gutter: 1em,
          counter(heading).display(it.numbering), it.body,
        )
        v(1em)
      },
    )
  }

  show heading.where(level: 1): it => {
    // Start a chapter on a new page unless it's the 1st chapter,
    // in which case it is already on a new page.
    if counter(heading).get() != (1,) {
      pagebreak()
    }

    // Do not justify top-level headings, which have a large font.
    set par(justify: false)

    if it.numbering == none {
      // Show the body of the heading.
      block(
        width: 100%,
        {
          set text(size: 24pt)
          v(1.5em)
          it.body
          v(1em)
        },
      )
    } else {
      // Show "Chapter n" and the body of the heading on 2 separate lines.
      align(
        center,
        block(
          width: 100%,
          {
            set text(size: 24pt)
            v(1.5em)
            text([Chapter ] + counter(heading).display(it.numbering))
            linebreak()
            it.body
            v(1em)
          },
        ),
      )
    }
  }
  // display contents
  [#it]
}


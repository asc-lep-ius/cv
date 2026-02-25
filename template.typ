// CV Template — Clean, ATS-friendly, Austrian-convention compatible
// Designed for 1–2 page tech CVs

#let accent-color-default = rgb("#2563eb")

#let icon-map = (
  "envelope": "✉",
  "phone": "☎",
  "location": "⌂",
  "linkedin": "in",
  "github": "⌗",
  "web": "⊕",
)

#let dates-right(body) = {
  h(1fr)
  text(size: 9pt, fill: luma(100), body)
}

#let cv(
  name: "",
  tagline: "",
  contact: (),
  date-of-birth: none,
  nationality: none,
  accent-color: accent-color-default,
  body,
) = {
  set document(title: name + " — CV", author: name)
  set page(
    paper: "a4",
    margin: (top: 1.8cm, bottom: 1.5cm, left: 1.8cm, right: 1.8cm),
  )
  set text(font: "Inter", size: 10pt, fill: luma(30))
  set par(justify: true, leading: 0.65em)

  show heading.where(level: 1): it => {
    text(size: 22pt, weight: "bold", fill: accent-color, it.body)
  }

  show heading.where(level: 2): it => {
    v(0.6em)
    block(width: 100%, {
      text(size: 12pt, weight: "bold", fill: accent-color, upper(it.body))
      v(-0.3em)
      line(length: 100%, stroke: 0.5pt + accent-color)
    })
    v(0.3em)
  }

  show heading.where(level: 3): it => {
    v(0.2em)
    text(size: 10pt, weight: "bold", fill: luma(40), it.body)
  }

  set list(indent: 0.4em, body-indent: 0.5em, marker: text(fill: accent-color, "▸"))

  // --- Header ---
  block(width: 100%, {
    align(center, {
      text(size: 24pt, weight: "bold", fill: luma(20), name)
      v(-0.3em)
      text(size: 12pt, fill: luma(80), tagline)
      v(0.4em)

      let contact-items = contact.map(c => {
        let ico = icon-map.at(c.icon, default: "•")
        text(size: 9pt, fill: luma(60), {
          text(weight: "bold", fill: accent-color, ico)
          h(0.2em)
          c.text
        })
      })
      contact-items.join(h(0.8em) + text(fill: luma(180), "|") + h(0.8em))

      if date-of-birth != none or nationality != none {
        v(0.2em)
        let extras = ()
        if date-of-birth != none { extras.push("Born: " + date-of-birth) }
        if nationality != none { extras.push("Nationality: " + nationality) }
        text(size: 9pt, fill: luma(100), extras.join("  ·  "))
      }
    })
  })

  v(0.5em)

  body
}

#let experience(
  role: "",
  company: "",
  location: "",
  dates: "",
  description: none,
) = {
  block(width: 100%, {
    grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 11pt, fill: luma(20), role + " — " + company),
      align(right, text(size: 9pt, fill: luma(100), dates)),
    )
    if location != "" {
      text(size: 9pt, fill: luma(100), location)
    }
    if description != none {
      v(0.1em)
      text(size: 9pt, style: "italic", fill: luma(80), description)
    }
  })
}

#let education(
  degree: "",
  institution: "",
  location: "",
  dates: "",
  details: none,
) = {
  block(width: 100%, {
    grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 10pt, fill: luma(20), degree),
      align(right, text(size: 9pt, fill: luma(100), dates)),
    )
    text(size: 9.5pt, fill: luma(60), institution + " · " + location)
    if details != none {
      v(0.1em)
      text(size: 9pt, fill: luma(80), details)
    }
  })
}

#let skills-grid(..items) = {
  let pairs = items.pos()
  for (category, skills) in pairs {
    grid(
      columns: (4.2cm, 1fr),
      gutter: 0.2em,
      text(size: 9pt, weight: "bold", fill: luma(60), category),
      text(size: 9.5pt, fill: luma(30), skills),
    )
    v(0.1em)
  }
}

#let languages(..items) = {
  let pairs = items.pos()
  for (lang, level) in pairs {
    grid(
      columns: (4.2cm, 1fr),
      gutter: 0.2em,
      text(size: 10pt, weight: "bold", fill: luma(40), lang),
      text(size: 10pt, fill: luma(60), level),
    )
    v(0.1em)
  }
}

#let project(
  name: "",
  tech: "",
  description: "",
) = {
  block(width: 100%, {
    grid(
      columns: (auto, 1fr),
      gutter: 0.4em,
      text(weight: "bold", size: 10pt, fill: luma(20), name),
      align(right, text(size: 8.5pt, fill: luma(100), tech)),
    )
    text(size: 9pt, fill: luma(50), description)
  })
  v(0.2em)
}

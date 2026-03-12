#let accent-color-default = rgb("#2563eb")

#let compact = sys.inputs.at("compact", default: "false") == "true"

#let icon-map = (
  "envelope": "✉",
  "phone": "☎",
  "location": "⌂",
  "linkedin": "in",
  "github": "⌗",
  "gitlab": "⌗",
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
    margin: if compact {
      (top: 1.2cm, bottom: 1.0cm, left: 1.4cm, right: 1.4cm)
    } else {
      (top: 1.4cm, bottom: 1.2cm, left: 1.6cm, right: 1.6cm)
    },
    header: {
      let dx = if compact { -1.4cm } else { -1.6cm }
      let dy = if compact { -1.2cm } else { -1.4cm }
      let extra = if compact { 2.8cm } else { 3.2cm }
      place(top + left, dx: dx, dy: dy,
        rect(width: 100% + extra, height: 3pt, fill: accent-color)
      )
    },
  )
  set text(font: "Inter", size: if compact { 8.5pt } else { 9.5pt }, fill: luma(30))
  set par(justify: true, leading: if compact { 0.5em } else { 0.6em })

  show heading.where(level: 1): it => {
    text(size: 22pt, weight: "bold", fill: accent-color, it.body)
  }

  show heading.where(level: 2): it => {
    v(if compact { 0.25em } else { 0.45em })
    block(width: 100%, {
      text(size: if compact { 10pt } else { 11pt }, weight: "bold", fill: accent-color, upper(it.body))
      v(-0.35em)
      line(length: 100%, stroke: 0.5pt + accent-color)
    })
    v(if compact { 0.1em } else { 0.2em })
  }

  show heading.where(level: 3): it => {
    v(0.15em)
    block(sticky: true, text(size: 9.5pt, weight: "bold", fill: luma(40), it.body))
  }

  set list(indent: 0.3em, body-indent: 0.4em, spacing: if compact { 0.35em } else { 0.55em }, marker: text(fill: accent-color, "▸"))

  block(width: 100%, {
    align(center, {
      text(size: if compact { 18pt } else { 22pt }, weight: "bold", fill: luma(20), name)
      v(-0.25em)
      text(size: if compact { 9.5pt } else { 11pt }, fill: luma(80), tagline)
      v(0.35em)

      let contact-items = contact.map(c => {
        let ico = icon-map.at(c.icon, default: "•")
        text(size: 8pt, fill: luma(60), {
          text(weight: "bold", fill: accent-color, ico)
          h(0.1em)
          c.text
        })
      })
      contact-items.join(h(0.4em) + text(size: 8pt, fill: luma(180), "|") + h(0.4em))

      if date-of-birth != none or nationality != none {
        v(0.15em)
        let extras = ()
        if date-of-birth != none { extras.push("Born: " + date-of-birth) }
        if nationality != none { extras.push("Nationality: " + nationality) }
        text(size: 8.5pt, fill: luma(100), extras.join("  ·  "))
      }
    })
  })

  v(0.3em)

  body
}

#let metrics-bar(accent-color: accent-color-default, ..items) = {
  let pairs = items.pos()
  let count = pairs.len()
  v(0.1em)
  block(width: 100%, inset: (x: 0.4em, y: 0.5em), radius: 3pt, fill: accent-color.lighten(93%), stroke: 0.5pt + accent-color.lighten(70%), {
    grid(
      columns: (1fr,) * count,
      align: center,
      ..pairs.map(((value, label)) => {
        stack(dir: ttb, spacing: 0.35em,
          text(size: 12pt, weight: "bold", fill: accent-color, value),
          text(size: 7.5pt, fill: luma(80), upper(label)),
        )
      })
    )
  })
  v(0.15em)
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
      text(weight: "bold", size: 10.5pt, fill: luma(20), role + " — " + company),
      align(right, text(size: 9pt, fill: luma(100), dates)),
    )
    if location != "" {
      text(size: 8.5pt, fill: luma(100), location)
    }
    if description != none {
      v(0.05em)
      text(size: 8.5pt, style: "italic", fill: luma(80), description)
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
    text(size: 9pt, fill: luma(60), institution + " · " + location)
    if details != none {
      v(0.05em)
      text(size: 8.5pt, fill: luma(80), details)
    }
  })
}

#let skills-grid(accent-color: accent-color-default, ..items) = {
  let pairs = items.pos()
  for (category, skills) in pairs {
    grid(
      columns: (3.6cm, 1fr),
      gutter: 0.15em,
      text(size: 8.5pt, weight: "bold", fill: accent-color.darken(20%), category),
      text(size: 9pt, fill: luma(30), skills),
    )
    v(0.05em)
  }
}

#let languages(..items) = {
  let pairs = items.pos()
  grid(
    columns: (3.6cm, 1fr),
    gutter: 0.45em,
    ..pairs.map(((lang, level)) => (
      text(size: 9.5pt, weight: "bold", fill: luma(40), lang),
      text(size: 9.5pt, fill: luma(60), level),
    )).flatten()
  )
}

#let project(
  name: "",
  tech: "",
  description: "",
) = {
  block(width: 100%, {
    grid(
      columns: (auto, 1fr),
      gutter: 0.3em,
      text(weight: "bold", size: 9.5pt, fill: luma(20), name),
      align(right, text(size: 8pt, fill: luma(100), tech)),
    )
    text(size: 8.5pt, fill: luma(50), description)
  })
  v(0.15em)
}

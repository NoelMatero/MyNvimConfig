---
title: Markview feature showcase
author: noelmatero
tags: [markdown, markview, testing]
---

# Markview showcase — H1

Compare three ways:

1. **Rendered** — just open this file.
2. **Raw, same window** — `:Markview toggle` to A/B in place.
3. **Vanilla** — `nvim -u NORC tests/markview-showcase.md` (no plugins, no config).

Anything that looks identical in 1 and 3 is *not* being rendered.

## Heading level 2

### Heading level 3

#### Heading level 4

##### Heading level 5

###### Heading level 6

Setext H1
=========

Setext H2
---------

## Inline text

**Bold**, *italic*, _also italic_, ***bold italic***, ~~strikethrough~~,
==highlighted==, `inline code`, and ``code with a ` backtick``.

This is the case that was broken before: generated elements carry
`customData` (`{ node, edge, edgeLabelFor, role, origin }`), so `readGraph()`
returns an exact node and edge list. Hand-drawn elements are reported as
`provenance: "inferred"` and are an *intention*, not a claim about code.

Escapes: \*not italic\*, \_not italic\_, \`not code\`, \# not a heading.

Entities: &amp; &lt; &gt; &copy; &hellip; &mdash; &alpha; &beta; &nbsp;

Emoji shorthands: :smile: :rocket: :warning: :tada: :bug:

Line break with two trailing spaces →  
this should be a new line.

## Links

- Inline: [markview.nvim](https://github.com/OXY2DEV/markview.nvim)
- With title: [nvim](https://neovim.io "Neovim homepage")
- Reference: [reference link][mv-repo]
- Autolink: <https://github.com/OXY2DEV/markview.nvim>
- Email: <someone@example.com>
- Bare email: someone@example.com
- Image: ![alt text](https://example.com/image.png)
- Internal / wiki link: [[Some Note]]
- Internal with alias: [[Some Note|shown text]]
- Embed file: ![[Some Note]]
- Block reference: [[Some Note#^block-id]]
- Footnote reference[^1] and another[^note].

[^1]: This is the first footnote.
[^note]: Named footnotes work too.

[mv-repo]: https://github.com/OXY2DEV/markview.nvim "Reference definition"

## Code

Inline: `local x = 1`

```lua
-- fenced, with language injection
local function greet(name)
  return ("hello, %s"):format(name)
end
print(greet("world"))
```

```python
def fib(n: int) -> int:
    return n if n < 2 else fib(n - 1) + fib(n - 2)
```

```diff
- removed line
+ added line
  unchanged line
```

```
fenced, no language
```

    indented code block
    second line

## Lists

- Dash item
- Another dash
  - Nested one level
    - Nested two levels
* Star item
+ Plus item

1. Ordered one
2. Ordered two
   1. Nested ordered
   2. Second nested
10. Large number

- Item with a paragraph

  Continuation paragraph inside the list item.

- Item with nested code:

  ```sh
  echo hi
  ```

## Checkboxes

Standard:

- [ ] Unchecked
- [x] Checked
- [X] Checked, capital

Extended states (from `presets.checkboxes.nerd`):

- [/] In progress
- [>] Forwarded
- [<] Scheduled
- [-] Cancelled
- [?] Question
- [!] Important
- [*] Star
- [l] Location
- [b] Bookmark
- [i] Info
- [S] Savings
- [I] Idea
- [p] Pro
- [c] Con
- [f] Fire
- [k] Key
- [w] Win
- [u] Up
- [d] Down

Nested checkboxes:

- [ ] Parent task
  - [x] Done subtask
  - [ ] Pending subtask

## Block quotes

> A plain block quote.
> Second line of the same quote.

> Nested quoting:
> > one level deep
> > > two levels deep

> A quote containing **bold**, `code`, and a [link](https://neovim.io).

## Callouts

> [!NOTE]
> Useful information a reader should know.

> [!TIP]
> Helpful advice.

> [!IMPORTANT]
> Key information.

> [!WARNING]
> Urgent info needing attention.

> [!CAUTION]
> Advises about risks.

> [!ABSTRACT]
> Also available as SUMMARY and TLDR.

> [!TODO]
> A todo callout.

> [!INFO]
> An info callout.

> [!SUCCESS]
> Also CHECK and DONE.

> [!QUESTION]
> Also HELP and FAQ.

> [!FAILURE]
> Also FAIL and MISSING.

> [!DANGER]
> Also ERROR.

> [!BUG]
> A bug callout.

> [!EXAMPLE]
> An example callout.

> [!QUOTE]
> Also CITE.

> [!HINT]
> A hint callout.

> [!ATTENTION]
> An attention callout.

> [!NOTE] Custom title on the same line
> Callouts accept a custom title.

## Tables

Simple:

| Name | Type | Default |
| --- | --- | --- |
| `enable` | boolean | `true` |
| `hl` | string | `MarkviewInlineCode` |

Alignment — left, center, right:

| Left | Center | Right |
| :--- | :----: | ----: |
| a | b | c |
| longer cell | mid | 42 |

The example from earlier, with inline formatting inside cells:

| | Cost | Needs a model | When to run |
| --- | --- | --- | --- |
| **Detection** — does the diagram disagree with the code? | milliseconds | no | every edit, pre-commit, CI |
| **Regeneration** — what should the diagram now say? | a model call | yes | when a human or the drift report asks |

Table containing pipes and code:

| Expression | Result |
| --- | --- |
| `a \| b` | bitwise or |
| `x ~= y` | not equal |

## Horizontal rules

---

***

___

## LaTeX

Inline math: $x^2 + y^2 = z^2$ and $\alpha + \beta = \gamma$.

Block math:

$$
\frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

$$
\sum_{i=1}^{n} i = \frac{n(n+1)}{2}
$$

Symbols: $\alpha \beta \gamma \delta \pi \infty \rightarrow \leq \geq \neq$

Superscript / subscript: $x^{2n}$, $a_{ij}$, $e^{i\pi} = -1$

Fonts: $\mathbb{R}$, $\mathcal{L}$, $\mathfrak{g}$, $\mathtt{code}$, $\mathbf{v}$

Parenthesis: $\left( \frac{1}{2} \right)$

Text inside math: $\text{if } x > 0$

## HTML

Container elements: <b>bold</b>, <i>italic</i>, <u>underline</u>,
<mark>marked</mark>, <code>code</code>, <sub>sub</sub>, <sup>sup</sup>,
<strong>strong</strong>, <em>emphasis</em>.

Void elements: line<br>break, and a rule:<hr>

<details>
<summary>Collapsed section</summary>

Hidden content with **markdown** inside.

</details>

## Edge cases

Heading immediately followed by text:
# Tight heading
Text right after.

Empty list items:

-
- non-empty

A very long line to check wrapping behaviour, because markview decorates in place and will not reflow hard-wrapped prose the way the GitHub preview does, which matters when comparing the two side by side.

Trailing conceal check — cursor onto this line to see hybrid mode reveal markers: **bold** `code` *italic*

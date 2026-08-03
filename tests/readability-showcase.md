# Readability showcase

Deliberately shaped like a long AI-generated plan, because that is the case these settings were tuned for. Every list item and paragraph below is a **single long logical line** — nothing here is hard-wrapped — so the soft-wrap behaviour is actually visible. There is no YAML frontmatter, so heading numbers start at `1` rather than `2`.

## What to look for

1. **Numbered headings** — every heading shows its position (`1.`, `1.4.`, `1.4.2.1.`). Scan the deep tree in section `1.4` and note you always know where you are. Because every section nests under one H1, the numbers all start with `1.` here.
2. **Wrapped-line hierarchy** — every wrapped line is indented to its block and prefixed with `↳`. This is the change that fixes long plans.
3. **No chrome** — no line numbers, no sign column, no fold column, no ruler at column 105.
4. **Reading column** — press `<leader>z` for a centred 90-column view.
5. **Folding** — `zM` collapses everything to headings, `zR` reopens, `za` toggles one.

To A/B any of it: `:Markview toggle` for raw vs rendered, or `nvim -u NORC tests/readability-showcase.md` for full vanilla.

## Wrapped-line hierarchy

### Nested bullets

The point of this section is the `↳` continuation marker and the indent that follows it. In vanilla Vim every one of these wrapped lines restarts at column 0, so a third-level bullet becomes visually indistinguishable from a top-level one.

- Top-level bullet with enough text to wrap at any reasonable window width, which is the whole point, because a wrapped top-level bullet should still read as a top-level bullet rather than dissolving into the left margin of the buffer.
  - Second-level bullet, also long enough to wrap, and this is where the old behaviour really hurt: the continuation used to land at column 0, level with nothing in particular, so you lost track of which branch of the plan you were reading.
    - Third-level bullet, longer still, describing some implementation detail that an AI planner felt was worth spelling out at length, with the continuation now clearly indented under its parent instead of escaping to the margin.
      - Fourth-level bullet, because generated plans nest further than anyone actually wants them to, and this is exactly the depth at which unindented wrapping became unreadable.
- Second top-level bullet, to confirm that returning to the outer level is visually obvious after all that nesting, even when this line wraps too.

### Ordered lists

1. First step of a procedure, written as one long line so that the wrap lands somewhere in the middle and you can confirm the continuation aligns past the `1.` marker rather than under it — that alignment is what `breakindentopt=list:-1` buys you.
2. Second step, equally long, verifying that a two-digit marker later in the list does not knock the alignment out of true when the list grows past nine entries.
3. Third step, with a nested ordered sub-list following it:
   1. Sub-step one, long enough to wrap, confirming that nested ordered items keep their own indent level when they continue onto another line.
   2. Sub-step two, same idea, different number, so you can see the markers line up cleanly down the left edge.

### Mixed content in a list item

- A bullet containing `inline code`, **bold text**, *italics*, and a [link](https://github.com/OXY2DEV/markview.nvim), all in one long wrapping line, to check that inline decoration survives soft-wrapping without shifting the indent.
- A bullet whose text runs long and then contains a code span like `vim.opt_local.breakindentopt = "list:-1"` near the very end, which is the position most likely to expose an off-by-one in wrap handling.

### Checkboxes

- [ ] An unchecked task with a long description, because generated plans love long task descriptions, and the checkbox icon should stay put while the text wraps beneath it.
- [x] A completed task, also long, verifying that the checked icon and any strikethrough styling behave the same way under wrapping as the unchecked variant does.
  - [ ] A nested subtask, long enough to wrap, at the indent level where losing hierarchy is most disorienting.
- [/] A partially complete task from the nerd preset, included to confirm the extended checkbox states still render after the preset was moved under `markdown_inline`.

## Quotes and callouts

> A plain block quote written as one long line, which should keep its `>` gutter bar down the left edge across every wrapped row rather than only marking the first one.

> [!NOTE]
> A note callout with enough prose to wrap at least once, so you can confirm the callout's coloured border continues down the full height of the block instead of stopping after the first line.

> [!WARNING]
> A warning callout, also long, because callouts are where generated plans put the things you least want to misread, and a broken left border makes the block hard to scan.

> [!TIP]
> Nested quoting still works underneath a callout:
> > An inner quote, long enough to wrap, verifying that the nesting indent is preserved on continuation lines.

## Numbered heading depth

This section exists purely to exercise the numbering. Watch the left side of each heading.

### First subsection

Text under 1.4.1.

### Second subsection

Text under 1.4.2, confirming the sibling counter increments.

#### A deeper heading

Text under 1.4.2.1.

#### Another deep heading

Text under 1.4.2.2.

##### Deeper still

Text under 1.4.2.2.1.

###### Deepest level

Text under 1.4.2.2.1.1 — six levels, which is as far as markdown goes.

### Third subsection

Text under 1.4.3, confirming the counter resets correctly at the level above after descending to level six.

## Long prose

A single long paragraph, unwrapped in the source, which is the honest test of the reading column. At full terminal width this line runs to a measure well past what is comfortable to read, and your eye loses the start of the next line on every return sweep. Press `<leader>z` and the same paragraph reflows into a centred ninety-column block, which is roughly what GitHub caps its rendered markdown at. The difference is most obvious on exactly this kind of unbroken explanatory text, which is what AI-generated plans produce the most of.

A second paragraph, shorter, to give the first one somewhere to end so you can see the spacing between blocks.

## Tables and code

| Setting | Before | After | Why it matters |
| --- | --- | --- | --- |
| `breakindent` | `false` | `true` | Wrapped lines keep their block indent instead of falling back to column 0 |
| `breakindentopt` | empty | `list:-1` | Continuation aligns past the list marker, matching GitHub |
| `showbreak` | empty | `↳ ` | Wrapped rows are visibly marked as continuations |
| `colorcolumn` | `+1` | empty | No ruler drawn through prose at column 105 |

```lua
-- The autocmd driving all of the above, scoped to markdown buffers only.
autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.breakindent = true
    vim.opt_local.breakindentopt = "list:-1"
    vim.opt_local.showbreak = "↳ "
  end,
})
```

## Edge cases

- A bullet followed by a fenced block, where the block must stay indented under its parent:

  ```sh
  echo "indented under the bullet"
  ```

- A bullet with a continuation paragraph:

  This paragraph belongs to the bullet above it and is long enough to wrap, so you can check that continuation paragraphs inside list items keep the list's indent rather than the document's.

- A bullet containing a very long unbroken token, which `linebreak` cannot split at a word boundary: `/Users/noelmatero/.config/nvim/lua/plugins/override/nvim-treesitter.lua`

Final line, deliberately short.

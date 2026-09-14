# HDI_QueryByAttribute

A 4D **HDI** (How Do I) example demonstrating `QUERY BY ATTRIBUTE` on **array attributes** inside an Object field — originally distributed as a binary `.4DB` database for 4D v16 R2, converted to a modern 4D project (`.4DProject`), and modernized for current 4D language conventions.

## What This Demonstrates

The `Person` table stores an arbitrary, schema-free `Children[].Name` / `Children[].Age` / `Children[].Toy[].Name` / `Children[].Toy[].Color` array structure inside an Object field (`OB_Field`). Querying multiple conditions against such an array raises an ambiguity: does each condition have to match *the same* array element, or is it enough that *some* element matches each condition independently? This example shows both:

- **Old syntax `[]`** — each condition is matched independently against *any* element of the array (no guarantee they refer to the same element).
- **New syntax `[a]` / `[b]`** — a letter inside the brackets links conditions together so they must match *the same* array element; a different letter opens an independent match within the same query, including across nested arrays (`Children[a].Toy[b].Name`).
- Three side-by-side samples of increasing complexity (single linked pair, two independent linked pairs, and a linked pair spanning a nested array) let you compare the two syntaxes and inspect the resulting selection in a listbox/JSON viewer.

## Project Structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Methods/00_Start.4dm` | Application entry point; opens the splash window (or brings it to front if already open) |
| `Project/Sources/Forms/HDI` | Splash screen; its `BtnDemo` button opens the main demo form |
| `Project/Sources/Forms/HDI2` | Main demo form — a description tab plus three `QUERY BY ATTRIBUTE` sample tabs, each with a listbox/JSON view of the query result |
| `Project/Sources/Forms/HDI2/ObjectMethods/Button*.4dm` | Runs one sample's old-syntax vs. new-syntax query pair, depending on `Form.newVersion` |
| `Project/Sources/Methods/initHDI.4dm` | Loads the sample descriptions/JSON for the tabs (subroutine, marked `invisible`) |
| `Project/Sources/Methods/_export.4dm` | Dev-only tool to regenerate `Resources/SAMPLES-en.json` from the `SAMPLES` table |
| `Resources/*.lproj` | XLIFF localisation resources (English source language + Japanese) |
| `Project/Sources/styleSheets*.css` | Form CSS: dark-mode colors and macOS Liquid Glass button sizing |

## Points of Interest

This project has been brought up to current 4D conventions (4D 21.1, `compatibilityVersion: 2101`). Notable changes from the original binary conversion:

- **Localisation** — every user-facing string (menu titles, form labels) is externalised to XLIFF (`Resources/{lang}.lproj/*.xlf`), grouped by purpose (menu, per-form, messages) rather than one monolithic file.
- **Modern variable declarations** — legacy `C_LONGINT`/`C_TEXT`/`C_BOOLEAN` directives replaced project-wide with `var`/`#DECLARE`; the demo-mode toggle no longer lives in a process variable at all — it's `Form.newVersion`, scoped to the form instance.
- **Standard menu actions** — the `Quit` menu item uses 4D's built-in `"action": "quit"` instead of a one-line method wrapper, so it gets correct platform integration (e.g. macOS Application menu placement) and automatic enable/disable.
- **Method visibility** — subroutines and form-dependent helper methods (`initHDI`) are marked `invisible` so only real entry points appear in the Run > Method... dialog.
- **Non-blocking dialog / window-reuse startup pattern** — `00_Start` uses `CALL WORKER` and non-blocking `DIALOG(...; *)` instead of spawning a dedicated process, and detects/re-focuses an already-open splash window instead of opening a duplicate. The splash's `BtnDemo` button has its own object method that opens the main demo form directly, instead of routing back through the startup method.
- **Dark mode & Liquid Glass** — form text/backgrounds use 4D's `"automatic"`/`"automaticAlternate"` color values so they adapt to the OS color scheme, and buttons are sized per `form-theme` (`liquid-glass` vs `mac-classic`) via CSS media queries rather than fixed pixel heights.
- **Listbox display defaults** — the listbox column uses `truncateMode: none` (no ellipsis truncation) and `resizingMode: legacy` (only the last column grows on resize).

These conventions are documented in more detail under [`.github/instructions/`](.github/instructions/), and apply uniformly across the modernized HDI example repositories.

## Requirements

- 4D 21.1 or later (project uses `compatibilityVersion: 2101`).
- No external dependencies; the `Person`/`SAMPLES` tables and their sample data are included with the project.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R2. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernized with the help of GitHub Copilot.

- **Blog post:** https://blog.4d.com/search-by-linking-array-attribute-query-arguments/
- **Original download:** https://download.4d.com/Demos/4D_v16_R2/HDI_QueryByAttribute.zip

## References

- `QUERY BY ATTRIBUTE`: https://developer.4d.com/docs/commands/query-by-attribute
- Object (field) type: https://developer.4d.com/docs/Concepts/dt_object
- Arrays in object notation: https://developer.4d.com/docs/Concepts/dt_object#object-and-collection-notation
- 4D CSS stylesheets: https://developer.4d.com/docs/FormEditor/stylesheets

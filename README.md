# apg-gherkin

Patterns from the ARIA Authoring Practices Guide (APG), written as Gherkin Features

## Current list of features

* [Accordion](features/accordion.feature)
* [Alert](features/alert.feature)
* [Alertdialog](features/alertdialog.feature)
* [Breadcrumb](features/breadcrumb.feature)
* [Button](features/button.feature)
* [Carousel](features/carousel.feature)
* [Checkbox](features/checkbox.feature)
* [Combobox](features/combobox.feature)
* [Dialog (Non-Modal)](features/dialog-non-modal.feature) †
* [Disclosure](features/disclosure.feature)
* [Feed](features/feed.feature)
* [Grid](features/grid.feature)
* [Landmarks](features/landmarks.feature)
* [Link](features/link.feature)
* [Listbox](features/listbox.feature)
* [Menubar](features/menubar.feature)
* [Menu Button](features/menu-button.feature)
* [Meter](features/meter.feature)
* [Modal Dialog](features/modal-dialog.feature)
* [Multithumb Slider](features/multithumb-slider.feature)
* [Radiogroup](features/radiogroup.feature)
* [Slider](features/slider.feature)
* [Spinbutton](features/spinbutton.feature)
* [Switch](features/switch.feature)
* [Table](features/table.feature)
* [Tabs](features/tabs.feature)
* [Toolbar](features/toolbar.feature)
* [Tooltip](features/tooltip.feature)
* [Treegrid](features/treegrid.feature)
* [Treeview](features/treeview.feature)
* [Window Splitter](features/window-splitter.feature)

† Not an APG pattern. The APG publishes only Dialog (Modal); this file is an AFixt extension
built from the normative statements about non-modal dialogs in that pattern's About section.

## These files are Gherkin-flavored prose, not runnable Gherkin

This corpus is a human-readable specification of the APG patterns. It is **not** guaranteed to
parse with a Gherkin parser or to run under a Cucumber-family runner, and it uses several
constructs standard Gherkin does not accept (`Examples:` under a plain `Scenario:`, and
`If` / `Optionally,` / `Otherwise,` / `Or` used as step keywords).

If you are consuming this repository as a pattern list — as apg-nightwatch, apg-jasmine,
apg-jest, apg-cypress, apg-mocha, apg-playwright and apg-usecases do — plan to translate these
files rather than execute them. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full house style.

## Required vs. optional behavior

The features document both required and optional behavior. Anything the APG marks `(Optional)`,
calls "recommended", or states only in a pattern's example rather than its normative tables is
marked — with a trailing `(Optional)` on the step, an `Optionally, ...` opener, or an
`(Optional)` / `(Recommended)` suffix on the scenario name. Unmarked steps are requirements.

## Note

Some patterns are still under development by the APG and may change in the future.
These Gherkin features are only accurate as of the date they were last maintained.
Read the [Contributing doc](CONTRIBUTING.md) to help keep them up to date.
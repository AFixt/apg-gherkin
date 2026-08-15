# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains Gherkin Feature files that describe ARIA widget patterns from the [ARIA Authoring Practices Guide (APG)](https://www.w3.org/WAI/ARIA/apg/). Each `.feature` file in `features/` maps to one APG pattern (accordion, alert, combobox, etc.) and specifies expected keyboard interaction, ARIA roles/states/properties, and accessibility behavior as BDD scenarios.

There is no build system, test runner, or application code. The deliverables are the `.feature` files themselves.

## Repository Structure

All feature files live in `features/`. Each file is laid out as `Feature` → `Background` (optional) → `Scenario` blocks with `Given`/`When`/`Then` steps.

## These Files Are Gherkin-Flavored Prose, Not Runnable Gherkin

This is a deliberate, settled decision — see issue #71. The corpus is a human-readable
specification of the APG patterns. It is **not** guaranteed to parse with a Gherkin parser
or run under a Cucumber-family runner, and it should not be fed to one without preprocessing.

Constructs used here that standard Gherkin does not accept:

- `Examples:` tables under a plain `Scenario:` rather than a `Scenario Outline:` with `<placeholder>` substitution.
- `If ...`, `Optionally, ...`, `Otherwise, ...` and `Or ...` used as step keywords. Gherkin recognizes only `Given`/`When`/`Then`/`And`/`But`/`*`.
- Prose steps beginning with a reserved keyword, e.g. `Examples could include ...` in `meter.feature`.

Downstream repos (apg-nightwatch, apg-jasmine, apg-jest, apg-cypress, apg-mocha,
apg-playwright, apg-usecases) consume this corpus as their canonical pattern list. They are
expected to translate it, not execute it. Do not "fix" these constructs into valid Gherkin
without reopening that decision.

## Required vs. Optional Behavior

The corpus documents **both** required and optional behavior, and marks the difference explicitly.
Behavior the APG marks `(Optional)`, "recommended", or describes only in a pattern's *example*
rather than its normative table must carry a marker; unmarked steps read as required.

- Mark an individual step with a trailing `(Optional)`, or open it with `Optionally, ...`.
- Mark a whole scenario by appending `(Optional)` or `(Recommended)` to its name.
- Where behavior comes from an APG example rather than the pattern itself, add a `#` comment above the steps saying so (see `accordion.feature`).
- Never promote example-level or optional behavior to an unmarked requirement.

## Alternative Interaction Models

Several patterns (listbox, treeview, tabs, treegrid, menubar) define two co-equal models that
an author chooses between. Cover **both**, in separate scenarios named to say which is which
(e.g. `- Recommended Model` / `- Alternative Model`), with a `#` comment noting they are
alternatives rather than a sequence. Do not silently collapse them into one catch-all step.

## Writing Feature Files

- Each feature file corresponds to a single APG pattern. The canonical source is the APG at w3.org/WAI/ARIA/apg/patterns/.
- Scenarios cover: keyboard interaction, ARIA roles/states/properties, focus management, and behavioral expectations.
- Use `Examples` tables for parameterized scenarios (see button.feature for an example).
- Include a user story (`As a... I want... So that...`) at the top of each feature.
- Some features use a `Background` block for shared preconditions; others do not — match the complexity of the pattern.
- A file covering something the APG does not publish as a pattern must say so in a `#` comment above `Feature:` (see `dialog-non-modal.feature`).

## Contributing Workflow

- PRs target the `develop` branch, not `main`.
- Each contribution should address a specific logged issue.
- When adding a new feature file, also add it to the list in `README.md`.

## Reviewing PRs

Whenever I ask to review a PR (pull request), use the `pr-review` skill.

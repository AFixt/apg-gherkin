# Contributing

Below, you'll find our guidelines for contributing to this repository. Your involvement is crucial in making this project more effective and accessible.

## Workflow

1. **Fork and Create a Branch**: If you're ready to contribute, start by forking the repository and then creating a new branch in your fork. This branch should be named descriptively, based on the issue you're addressing.

2. **Focus on a Specific Issue**: Each contribution should be focused on solving a specific issue that has been logged in the repository's issue tracker. Before starting work, ensure the issue is not already being addressed by another contributor.

3. **Making Changes**: With your branch ready, you can start making your changes. Please ensure your code adheres to the existing coding standards and that you're committing your changes regularly.

4. **Write Meaningful Commit Messages**: Your commit messages should clearly describe what has been changed or added. This helps maintainers understand your changes better and speeds up the review process.

5. **Pull Requests**: Once you're satisfied with your changes, create a pull request against the `develop` branch of the original repository. Your pull request should detail what the changes are and reference the issue it resolves.

6. **Code Review**: The maintainers will review your pull request and may suggest changes or improvements. This is a collaborative process, so constructive feedback and discussion are encouraged.

7. **Merge**: Once your pull request is approved, a maintainer will merge it into the `develop` branch.

## House Style for Feature Files

Please read this before editing anything in `features/`.

### The files are Gherkin-flavored prose, not runnable Gherkin

These files are a human-readable specification of the APG patterns. They are **not**
guaranteed to parse with a Gherkin parser or run under a Cucumber-family runner. The
corpus deliberately uses constructs standard Gherkin does not accept:

- `Examples:` tables under a plain `Scenario:` rather than a `Scenario Outline:` with `<placeholder>` substitution.
- `If ...`, `Optionally, ...`, `Otherwise, ...` and `Or ...` as step keywords. Gherkin recognizes only `Given`/`When`/`Then`/`And`/`But`/`*`.
- Prose steps that begin with a reserved keyword.

Downstream AFixt repos (apg-nightwatch, apg-jasmine, apg-jest, apg-cypress, apg-mocha,
apg-playwright) and apg-usecases consume this corpus as their canonical pattern list and are
expected to translate it rather than execute it. Please don't submit PRs converting these
constructs to valid Gherkin — that's a settled decision, and reversing it should start as an
issue, not a PR.

### Mark optional behavior explicitly

The corpus documents both required and optional behavior. Anything the APG marks `(Optional)`,
calls "recommended", or states only in a pattern's *example* rather than its normative
keyboard/properties table must be marked. Unmarked steps read as requirements.

- Mark a step with a trailing `(Optional)`, or open it with `Optionally, ...`.
- Mark a whole scenario by appending `(Optional)` or `(Recommended)` to its name.
- If the behavior comes from an APG example rather than the pattern, add a `#` comment above the steps saying so.

### Cover both alternative interaction models

Where the APG offers two co-equal models an author chooses between, cover both in separate,
clearly named scenarios rather than collapsing them into one vague step.

### Cite the APG

Every scenario should be traceable to text on the relevant APG pattern page. If you can't
point at the sentence it came from, it doesn't belong in the file.

## Logging Issues

If you're not comfortable with Git or coding, you can still contribute significantly by logging issues. Whether it's a bug you've found or a feature suggestion, your feedback is valuable.

1. **Check Existing Issues**: Before creating a new issue, please check the repository's issue tracker to ensure the issue hasn't already been reported.

2. **Create a New Issue**: If your issue is new, go ahead and create it. Provide as much detail as possible, including steps to reproduce the issue, the expected outcome, and any other relevant information.

3. **Engage in the Discussion**: Once your issue is logged, you might receive comments or questions from the maintainers or other contributors. Engaging in this dialogue helps clarify the issue and guides its resolution.

Thank you for contributing to [Repository Name]! Your efforts help build a stronger and more effective project. If you have any questions or need assistance, feel free to reach out to the maintainers.

# Project Instructions for AI Coding Agents

## 1. General rules

- Read the relevant existing code before making changes.
- Follow the architecture, naming, and coding patterns already used in the project.
- Do not introduce a new package, framework, or architectural pattern without explaining why.
- Prefer small, focused changes over broad refactors.
- Do not rewrite unrelated files or change formatting across the project unnecessarily.
- Do not invent APIs, package methods, configuration keys, or file paths. Verify them in the project or installed dependencies.
- If a requirement is ambiguous and affects architecture or behavior, ask before proceeding.
- Use null-safe, idiomatic Dart.
- Follow Effective Dart conventions and the project's analyzer rules.
- Prefer `const` constructors and widgets when applicable.
- Keep widgets focused and reasonably small; extract reusable widgets when it improves clarity.
- Avoid unnecessary rebuilds, duplicated logic, and deeply nested widget trees.
- Use appropriate types instead of `dynamic` where possible.
- Handle loading, success, empty, and error states where relevant.
- Dispose of controllers, subscriptions, and other owned resources correctly.
- Respect widget lifecycle rules. Do not call `setState` after disposal.
- Use `async`/`await` consistently and handle errors intentionally.
- Avoid unnecessary work in `build()` methods.
- final instead of var for immutable values.
- Use const constructors and avoid unnecessary object allocation.
- Use enums over string literals where type safety is needed.
- Prefer List.map() and List.where() with whereType<>() instead of imperative loops.
- Avoid using new or explicit null checks unless necessary for clarity.

## 2. Performance Considerations
- Avoid expensive operations on render threads: Add guidelines for build() performance (no heavy computation, no I/O, use const when possible)
- Limiter rules: Keep widgets with ~100 lines or less; extract reusable widgets.
- List rendering: Use ListView.builder() instead of large lists in WidgetBuilder.
- Async/await performance: Explain that async operations should not block main thread, use background workers for heavy computation.

## 3. Architecture and state management

- Inspect the existing state management, navigation, dependency injection,
  and data-access patterns before implementing features.
- Reuse existing providers, controllers, repositories, services, and models.
- Do not introduce a second state management solution.
- Keep UI, business logic, and data access separated according to the
  project's existing architecture.
- Do not move code between architectural layers unless the task requires it.
- Keep public interfaces stable unless a change is necessary.

## 4. Dependencies and configuration

- Prefer existing dependencies over adding new ones.
- Before adding a package, explain its purpose and consider whether the
  requirement can be met with Flutter or Dart APIs already available.
- Never silently upgrade Flutter, Dart, or unrelated package versions.
- Do not modify signing credentials, secrets, environment files, or
  platform configuration without explicit approval.
- Never place API keys, tokens, or passwords in source code.

## 5. Testing and verification

- Add or update tests for meaningful behavior changes.
- Prefer unit tests for business logic and widget tests for UI behavior.
- Follow existing test naming, fixtures, and mocking conventions.
- Before finishing, run the most relevant checks available:
  1. dart format on changed Dart files
  2. flutter analyze
  3. relevant flutter test commands
- If a command fails, investigate whether the change caused the failure.
- Never claim that tests or analysis passed unless they actually ran
  successfully.
- If checks cannot run, state what was not verified and why.
- Prefer integration tests for end-to-end validation of business logic.
- Mock Dio network calls and use test server or mock packages like http.
- Use determinism in tests; avoid async-dependent behavior where possible.

## 6. Editing workflow

For non-trivial tasks:

1. Inspect relevant files and identify existing conventions.
2. Summarize the intended approach and files to change.
3. Implement the smallest complete solution.
4. Review the diff for unrelated changes and potential regressions.
5. Run relevant formatting, analysis, and tests.
6. Report the changes, checks performed, and remaining risks.

For simple tasks, avoid unnecessary planning and keep the response concise.

## 7. File and privacy boundaries

- Treat generated files and dependency directories as read-only.
- Do not edit build/, .dart_tool/, ios/Pods/, or dependency caches
  unless the task explicitly concerns generated artifacts.
- Do not read or expose secrets in .env files, signing files, or credentials.
- Do not send project source code to external services unless explicitly
  authorized by the user.
- Prefer local tools and locally hosted models when available.
- Do not execute destructive commands or overwrite user data without approval.
- Never expose sensitive data (e.g., API keys, tokens) to the environment file outside of .env or configuration files.
- Never use dynamic for security-sensitive code where type safety is critical.
- Use flutter_secure_storage package for persistent credentials; avoid storing passwords in plain text.


## 8. Completion report

At the end of a coding task, summarize:

- What changed
- Important design decisions
- Checks actually performed and their results
- Any unresolved issues or assumptions

## 9. Flutter-Specific Rules
- Widget composition: Build UI through composition, not inheritance, where possible.
- Avoid mutable state in widgets: Use const constructors where appropriate.
- Lifecycle rules: Explicitly handle disposal before using state after dispose().
- State update frequency: Minimize setState calls; use ValueNotifier, ChangeNotifierProvider, or async callbacks.
- Error handling: Always catch exceptions in error-bound code (network, file I/O).

## 10. Code Clarity & Documentation
- Use descriptive names over single-word abbreviations for variables, functions, classes.
- Document public APIs with clear comments explaining intent and usage.
- Use /// documentation comments before all public API surfaces.
- Keep files small; aim for single feature or single responsibility per file.

## 11. CI/CD & Build
- Use flutter analyze, dart format --set-exit-if-changed, flutter test in CI pipelines.
- Enable error mode (dart -Ddart.vm.profile=true and -Ddart.vm.profile=true) for production builds.
- Use --dry-run before making changes.
- Run tests with coverage for critical paths.

## 12. Memory Management
- Ensure proper disposal of streams (sink().whenComplete(() => stop())).
- Use StreamBuilder or SinksProvider instead of heavy state management in long-running async operations.
- Avoid creating large objects inside loops; use const constructors, const functions, and immutable data structures where possible.

## 13. Code Quality Metrics
- Use static analysis tools like:

Dart Lint (dart analyze)
Flutter analyzer (flutter analyze with --fatal-infos, --fatal-warnings)
Coveralls or coverage reports for CI


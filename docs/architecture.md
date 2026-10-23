
# Architecture Reference

## Overview

- Framework: Flutter
- Language: Dart
- Architecture: Clean Architecture
- State management: Bloc/Cubit
- Feature organization: [Feature-first / layer-first]
- Navigation: go_router
- Dependency injection: get_it
- Networking: retrofit
- Persistence: flutter_secure_storage

## Feature structure

Each feature follows the conventions already present in the repository.

Typical responsibilities:

### Presentation
- Pages and widgets render UI.
- Bloc/Cubit manages presentation state.
- User actions are translated into events or method calls.
- Presentation depends on domain abstractions.

### Domain
- Entities represent business concepts.
- Repository contracts define required operations.
- Use cases contain meaningful application/business operations.
- Domain code is independent of Flutter and infrastructure.

### Data
- Data sources access remote APIs or local storage.
- Models/DTOs represent external or persisted data.
- Repository implementations fulfill domain contracts.
- Mapping converts external models into domain entities.

## Dependency direction

Presentation -> Domain <- Data

Data implements contracts defined by Domain.
Domain must not depend on Presentation or Data.

## State conventions

- Initial state is empty or loading
- Loading is relevant for showing progress indicators and disabling actions in the UI
- Success may result in navigation changes, UI state changes, or SnackBar notifications
- Empty results are still considered success unless Exceptions were thrown
- Failure should be depicted in the UI and propagated from the Bloc or Cubit
- Refresh may be triggered from pull to refresh actions and be equivalent to an initial load
- Equality and state classes are handled using freezed classes

## Error handling

- GeneralFailure
- Exceptions may be thrown or returned as Failure models by repositories to Bloc or Cubit classes
- Failures are presented as special UI components, SnackBars, custom widgets, error states, or navigation events

## Testing conventions

- Domain: unit tests for business rules.
- Data: repository and mapping tests.
- Presentation: Bloc/Cubit tests and widget tests.
- Prefer deterministic tests without real network calls, mock Dio calls.

## Important decisions

- flutter_secure_storage is used for persisting data that should be stored securely on the device.
- Each feature consists of the 3 layers for data, presentation, and domain, with extra extensions, services, helpers, reusable widgets that may be shared.

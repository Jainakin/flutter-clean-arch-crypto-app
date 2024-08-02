# Flutter Clean Architecture App:

This project demonstrates a flutter app built with a clean architecture & Test Driven Development approach. The goal is to provide a well-structured and maintainable codebase.

## Architecture:

Clean Architecture: The application follows the principles of Clean Architecture, separating concerns into distinct layers:

- **Presentation Layer**: Handles UI interactions and user input.
- **Domain Layer**: Encapsulates business logic and domain rules.
- **Data Layer**: Provides data access and persistence.

- **Provider**: Project uses the Provider package for state management, simplifying data sharing and UI updates.
- **Dio**: For network communication, the Dio package is used, offering a robust and flexible API for making HTTP requests.
- **GetIt**: Dependency Injection is handled with the GetIt package, promoting code reusability and testability.
- **Firebase Authentication**: The app utilizes Firebase Authentication for user authentication.

## Dependencies:

- **flutter**: Core Flutter framework.
- **provider**: State management and UI updates.
- **dio**: Network communication.
- **get_it**: Dependency Injection.
- **firebase_core**: Firebase initialization.
- **firebase_auth**: Firebase Authentication.
- **connectivity_plus**: Network connectivity monitoring.
- **google_fonts**: Custom fonts.
- **equatable**: For simplifying equality checks in data models.
- **dartz**: For functional programming concepts and error handling.

## Testing:

Integration Tests: Implemented integration tests to validate the login flow, bitcoin transaction details screen, and tezos transaction details screen.

To run the integration tests, use the following command:

```sh
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/authentication_test.dart integration_test/bitcoin_transaction_test.dart integration_test/tezos_transaction_test.dart
```

### Test Account Credentials:

- **Email**: test@t.com
- **Password**: 123456

## Project Structure:

```plaintext
├── pubspec.yaml
├── README.md
├── integration_test
│   ├── authentication_test.dart
│   ├── bitcoin_test.dart
│   └── tezos_test.dart
├── test_driver
│   └── integration_test.dart
└── lib
    ├── core
    │   ├── error
    │   │   ├── failure.dart
    │   │   ├── exceptions.dart
    │   ├── usecases
    │   │   ├──  usecases.dart
    │   └── network
    │       ├── network_info.dart
    ├── features
    │   ├── feature_name
    │   │   ├── data
    │   │   │   ├── datasources
    │   │   │   │   └── remote_data_source.dart
    │   │   │   ├── models
    │   │   │   │   └── model.dart
    │   │   │   ├── repositories
    │   │   │   │   └── repository_impl.dart
    │   │   ├── domain
    │   │   │   ├── entities
    │   │   │   │   └── model.dart
    │   │   │   ├── repositories
    │   │   │   │   └── repository.dart
    │   │   │   └── usecases
    │   │   │       └── usecase.dart
    │   │   ├── presentation
    │   │   │   ├── pages
    │   │   │   └── provider
    │   │   │   └── widgets
    │   └── main.dart
```

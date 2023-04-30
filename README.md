
# Flutter Jumia Clone App Using BLoC and Clean Architecture with Firebase

This is a Flutter Jumia clone app built using the BLoC pattern and following the principles of Clean Architecture. The app's data is stored and managed using Firebase.

## Features

- View a list of products
- Filter products by category and price range
- Add products to cart
- View cart and update quantities
- Place an order
- View order history

## Architecture

This app follows the principles of Clean Architecture, which promotes separation of concerns and testability. The app is divided into three layers:

- Presentation: This layer contains the UI and the BLoCs that manage the app's state. The UI is built using Flutter widgets and the BLoCs use the `flutter_bloc` package to manage state.
- Domain: This layer contains the business logic of the app. It defines the entities, use cases, and interfaces that the app depends on.
- Data: This layer contains the implementation of the interfaces defined in the domain layer. It handles data storage and retrieval using Firebase.

## Getting Started

To run the app, follow these steps:

1. Clone this repository.
2. Open the project in Android Studio or Visual Studio Code.
3. Set up a Firebase project and add your Firebase configuration to the `android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist` files.
4. Run the app using the `flutter run` command.

## Screenshots

![Screenshot 1](screenshots/screenshot_1.png)
![Screenshot 2](screenshots/screenshot_2.png)
![Screenshot 3](screenshots/screenshot_3.png)

## Dependencies

This app uses the following dependencies:

- `flutter_bloc` for state management
- `equatable` for value equality
- `firebase_core` and `cloud_firestore` for Firebase integration
- `intl` for internationalization

## Credits

This app was created by [Abdelrahman sobhy] as a project for [clean architecture projects].

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

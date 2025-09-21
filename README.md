# Pokedex Flutter Assessment

A Flutter application that showcases a Pokedex feature. Explore a collection of Pokemon and discover their unique characteristics.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [How to Build the App](#how-to-build-the-app)
- [License](#license)

## Project Overview

A simple Pokedex mobile app built with Flutter for the technical assessment at Simpan. The app consumes the [GraphQL Pokémon API](https://graphql-pokemon2.vercel.app/) and demonstrates clean architecture, Bloc state management, and UI/UX best practices.

## Getting Started

To get started with the Pokedex Flutter Assessment, follow these steps:

1. Clone the repository: `git clone git@github.com:artprasetya/pokedex_flutter_assessment.git`
2. Install dependencies: `flutter pub get`
3. Run the application: `flutter run`

## Features

- 🔄 Infinite scroll list of Pokémons
- 📄 Details page with Pokémon stats
- 🔍 Search for specific Pokemon by name
- 🗂 Clean architecture (Service → Repository → Bloc → UI)
- 🛠 Dependency injection with GetIt

## Tech Stack

- **Flutter**: The framework used to build the application. [Learn more about Flutter](https://flutter.dev/)
- **Dart**: The programming language used for Flutter development. [Learn more about Dart](https://dart.dev/)
- **Dio**: A powerful HTTP client for making API requests. [Learn more about Dio](https://pub.dev/packages/dio)
- **GetIt**: A simple and efficient dependency injection solution. [Learn more about GetIt](https://pub.dev/packages/get_it)
- **GraphQL**: A query language for APIs that allows for efficient data retrieval. [Learn more about GraphQL](https://graphql.org/)
- **Flutter Bloc**: A state management solution for Flutter applications. [Learn more about Flutter Bloc](https://pub.dev/packages/flutter_bloc)

## How to Build the App

To build the app, simply type `flutter build apk --debug` in your terminal to build the debug version of the app. For the release version, use `flutter build`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

# InterviewPrep - Mock Interview Preparation Tool

A Flutter application designed to help users prepare for interviews by managing coding questions, tips, and providing a seamless chat functionality. This project adheres to the Clean Code Architecture and incorporates various design patterns and technologies, including Provider/Riverpod and bloc for state management, Firebase for remote database functionalities, SQLite and Hive for local data storage, and advanced animations for a polished user experience.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Usage](#usage)
  - [App Layer](#app-layer)
  - [Features Layer](#features-layer)
  - [Shared Layer](#shared-layer)
- [APIs](#apis)
- [State Management](#state-management)
- [Local & Remote Databases](#local--remote-databases)
- [Caching](#caching)
- [Animations](#animations)
- [UI/UX Design](#uiux-design)
- [Hidden Features (BONUS)](#hidden-features-bonus)

## Features

- **Clean Code Architecture**: Promotes a modular design, enhancing testability and maintainability.
- **Local Database (SQLite & Hive)**: Stores coding questions, tips, and interview tracks for offline access.
- **Remote Database (Firebase/REST API)**: Integrates Firebase Firestore for user and question management, ensuring real-time synchronization.
- **Caching (SharedPreferences)**: Implements local caching for frequently accessed data, improving performance and user experience.
- **Dio and Retrofit**: Manages HTTP requests efficiently for fetching data from APIs.
- **Connectivity**: Checks the internet connection status to manage online and offline data fetching.
- **Hero Animations**: Provides dynamic transitions between screens, enhancing navigation.
- **Custom Page Transitions**: Uses fade, slide, and scale animations for a modern UI feel.
- **Material Design Principles**: Ensures adherence to professional design standards for a polished appearance.
- **State Management**: Utilizes Provider or Riverpod and bloc for managing the app’s global state effectively.

### Recipe Feature

- **Recipe List with API Integration**: Fetches a list of recipes from a public API using Dio and Retrofit for network requests.
- **Cubit for State Management**: Implements the Cubit pattern to manage the state of the recipe list, handling loading, success, and error states.
- **Caching Recipes**: Stores fetched recipes in Hive for quick access and offline availability, allowing users to browse recipes without an internet connection.

### Travel CRUD Feature

- **Travel Management**: Provides CRUD (Create, Read, Update, Delete) functionality for travel destinations.
- **Firestore Integration**: Utilizes Firebase Firestore for storing travel data, ensuring real-time data management.
- **Hive for Local Storage**: Caches travel data locally using Hive, enabling offline access and synchronization with Firestore when the app is online.

### Tips and Tracks Feature

- **Interview Tips Management**: Allows users to store and manage various interview tips, helping them prepare effectively.
- **Track Interview Progress**: Users can track their interview preparation progress, marking tips as reviewed or completed.
- **Local Storage with SQLite**: Uses SQLite for local storage of tips and tracks, ensuring offline access and quick retrieval of information.

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase Project with Firestore and Authentication enabled
- SQLite and Hive setup for local storage
- Flutter packages: dio, retrofit, cubit, hive, hive_flutter, firebase_core, cloud_firestore, shared_preferences, connectivity_plus

### Installation

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Set up Firebase in your project following the official Firebase setup guide.
5. Configure SQLite and Hive for offline data storage.

### Running the App

- Use `flutter run` to launch the app on a simulator or connected device.
- Ensure Firebase is correctly configured for authentication and database features.

## Usage

### App Layer

This layer contains the core application logic, including network setup, error handling, and dependency injection.

### Features Layer

This layer is divided into sub-modules for each feature, including authentication, coding questions, recipes, travel management, and tips/tracks.

### Shared Layer

Contains shared resources and utilities across the app.

## Local & Remote Databases

- **Local Database (SQLite & Hive)**: Stores coding questions, tips, and interview tracks for offline access, allowing users to browse saved content without an internet connection.
- **Remote Database (Firebase/REST API)**: Fetches data from Firebase Firestore and synchronizes it with the local SQLite database when online, ensuring users have the latest content.

## Caching

- Implements data caching using SharedPreferences to store frequently accessed data such as questions, recipes, interview tips, and tracks.
- Data synchronization logic updates local cache with the latest remote data when online.

## Animations

- **Hero Animations**: Smooth transitions between question list and details.
- **Custom Page Transitions**: Engaging navigation effects.
- **Implicit Animations**: Enhances user engagement through a responsive UI.

## UI/UX Design

- **Material Design Principles**: Ensures a professional look and feel.
- **Theme Management**: Allows users to switch between light and dark themes, with settings stored locally.

## State Management

- Implements state management using Provider or Riverpod and bloc, managing user data and app state.
- Utilizes Cubit for managing states related to the recipe feature, travel CRUD operations, and tips/tracks.
- Adopts MVVM architecture for better separation of concerns.

## Hidden Features (BONUS)

- **Swipe Gestures for Tips**: Allows users to browse interview tips horizontally.
- **Long Press for Pro Tips**: Unlocks additional tips or advanced techniques with long-press interactions.

## Project Structure

The project is organized into three main layers: `app`, `features`, and `shared`.

### **`lib/`**
```plaintext
lib/
├── app/                    # Core application-level logic
│   ├── network/            # Network-related classes (e.g., Dio setup, API client)
│   ├── error/              # Error handling (exceptions, failures)
│   ├── di/                 # Dependency injection setup
│
├── features/               # Feature-specific logic
│   ├── auth/               # Authentication feature
│   │   ├── data/           # Data layer for authentication
│   │   ├── domain/         # Domain layer for authentication
│   │   └── presentation/   # UI and state management for authentication
│   │
│   ├── questions/          # Interview questions feature
│   │   ├── data/           # Data layer for questions
│   │   ├── domain/         # Domain layer for questions
│   │   └── presentation/   # UI and state management for questions
│   │
│   ├── recipes/            # Recipe feature
│   │   ├── data/           # Data layer for recipes (API)
│   │   ├── domain/         # Domain layer for recipes
│   │   └── presentation/   # UI and state management for recipes
│   │
│   ├── travel/             # Travel feature
│   │   ├── data/           # Data layer for travel CRUD (Firestore)
│   │   ├── domain/         # Domain layer for travel
│   │   └── presentation/   # UI and state management for travel
│   │
│   ├── tips_tracks/        # Tips and Tracks feature
│   │   ├── data/           # Data layer for tips and tracks
│   │   ├── domain/         # Domain layer for tips and tracks
│   │   └── presentation/   # UI and state management for tips and tracks
│
└── shared/                 # Shared resources across the app
    ├── constants/          # App-wide constants
    └── utils/              # Utility classes and helpers

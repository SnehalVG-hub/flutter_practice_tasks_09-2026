# Flutter Bottom Navigation App

A simple Flutter app demonstrating **Bottom Navigation Bar** and switching between multiple pages.

## Features

* 🏠 Home page
* ❤️ Favourite page
* 👤 Profile page
* Bottom navigation between pages
* Stateful navigation using `setState()`
* Simple `Row`, `Column`, `Padding`, and `CircleAvatar` layouts

## Concepts Used

* `StatelessWidget`
* `StatefulWidget`
* `setState()`
* `List<Widget>`
* `BottomNavigationBar`
* `currentIndex`
* `onTap`
* `Row`
* `Column`
* `Padding`
* `CircleAvatar`
* `Scaffold`
* `AppBar`

## How It Works

The app stores the three pages in a list:

```dart
List<Widget> pages = [
  HomeContent(),
  FavouritePage(),
  ProfPage(),
];
```

The `currentPage` variable decides which page is displayed:

```dart
body: pages[currentPage],
```

When the user taps a navigation item, `currentPage` changes and `setState()` rebuilds the screen:

```dart
onTap: (index) {
  setState(() {
    currentPage = index;
  });
}
```

## Pages

| Icon | Page      |
| ---- | --------- |
| 🏠   | Home      |
| ❤️   | Favourite |
| 👤   | Profile   |

## Getting Started

1. Clone or download the project.
2. Open the project in VS Code or Android Studio.
3. Run:

```bash
flutter pub get
```

4. Start the app:

```bash
flutter run
```

## Learning Goal

This project was created to practice **Flutter navigation, StatefulWidget, setState, lists of widgets, and basic UI layout**.

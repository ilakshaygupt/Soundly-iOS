# Soundly iOS Application

Soundly is a feature-rich iOS music application offering seamless playback, playlist management, and a stunning user interface. The app integrates with modern SwiftUI practices and includes WatchOS support for music control on the go.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

---

## Features

1. **Authentication**: Includes login, signup, OTP verification, and forgot username workflows.
2. **Music Playback**: Features Now Playing bar, global player view, and intuitive controls.
3. **Playlists**: Create, view, and manage playlists effortlessly.
4. **Search**: Quickly search for songs, albums, and artists.
5. **Dynamic UI**: Smooth animations, responsive layout, and SwiftUI modifiers.
6. **WatchOS Integration**: Control playback from your Apple Watch.

---

## Installation

### Prerequisites

- macOS with Xcode installed (v13 or later).
- Swift 5.5 or later.
- CocoaPods or Swift Package Manager for dependencies.

### Libraries Used

- **SwitchKeyChainWrapper**: A library for securely storing sensitive data in the keychain.
- **NetworkImage**: A library for loading images from the network efficiently.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/ilakshaygupt/soundly-ios.git
   ```
2. Open the project in Xcode:
   ```bash
   cd soundly-ios
   open Soundly.xcodeproj
   ```
3. Build and run the application on your simulator or connected device.

---

## Usage

1. Launch the app and sign up/login.
2. Explore the home page to play trending songs or search for your favorites.
3. Manage your playlists and enjoy seamless music playback.
4. Use the WatchOS app to control playback directly from your wrist.

---

## Folder Structure

```
└── ilakshaygupt-soundly-ios/
    ├── Soundly/
    │   ├── Connector.swift
    │   ├── ContentView.swift
    │   ├── Info.plist
    │   ├── SoundlyApp.swift
    │   ├── ToastModifier.swift
    │   ├── Assets.xcassets/
    │   ├── Commons/
    │   ├── Features/
    │   ├── Preview Content/
    │   └── Utilities/
    ├── Soundly.xcodeproj/
    └── SoundlyWatchOs Watch App/
```

### Highlights

- **Features**: Organized by modules such as Auth, Library, Search, and HomePage.
- **Utilities**: Contains shared logic like API handling and music player management.
- **Assets**: Stores images, icons, and other resources used across the app.

---

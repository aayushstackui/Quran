# Quran

A beautifully crafted Quran reading application for iOS, built with Swift and SwiftUI. This application provides a minimal, elegant, and user-friendly way for users to read and explore the Quran on their iPhones. Designed using the MVVM architecture, the app leverages Firebase for authentication and integrates modern Swift best practices.

## 🚀 Features

- 🔐 Firebase Authentication – Secure login/logout with Firebase integration  
- 📖 Verse Browsing – View and scroll through Quranic verses (Surahs and Ayahs)  
- 🧠 MVVM Architecture – Clean separation of business logic and UI  
- 💬 Error Handling – Contextual error messages with a custom identifiable error type  
- ⏳ Loading Overlay – Displays a loading animation during asynchronous operations  
- ✅ Unit & UI Testing – Preconfigured tests using XCTest and XCUITest  
- 📱 SwiftUI UI/UX – Responsive layout and animations built with modern SwiftUI components  

## 🧱 Project Structure

```
Quran/
├── QuranApp.swift                 # Main app entry point using @main
├── ViewModel/
│   ├── LoginViewModel.swift      # Handles login logic and authentication state
│   └── QuranViewModel.swift      # Business logic for Quran data retrieval
├── Views/                        # SwiftUI Views (recommended to organize if expanding)
├── LoadingOverlay.swift          # Reusable component for showing a loading indicator
├── IdentifiableError.swift       # Custom struct conforming to Identifiable & Error
├── GoogleService-Info.plist      # Firebase iOS configuration (private key)
├── QuranTests/                   # Unit tests for ViewModels and core logic
├── QuranUITests/                 # UI automation tests
└── Quran.xcodeproj/              # Xcode project configuration
```

## 📲 Installation Instructions

### Prerequisites  
- macOS with Xcode 13 or later  
- Swift 5.5+  
- CocoaPods (if dependencies are introduced)  
- Firebase Console account (for Authentication)  

### Setup Steps  
1. Clone the Repository  
```bash
git clone https://github.com/your-username/quran-ios.git
cd quran-ios/Quran
```

2. Open in Xcode  
```bash
open Quran.xcodeproj
```

3. (Optional) Install dependencies via CocoaPods or SPM if needed  
```bash
pod install
```

4. Firebase Configuration  
- Go to [Firebase Console](https://console.firebase.google.com/)  
- Create a project and register your iOS bundle ID (e.g., `com.yourcompany.Quran`)  
- Download `GoogleService-Info.plist` and replace the existing file in `Quran/Quran/`  

5. Build and Run  
- Select an iOS simulator (or your device)  
- Press `Cmd + R` or use the ▶️ button in Xcode  

## 🔐 Firebase Authentication

The app uses Firebase Authentication to manage user sessions.  
- Supports Email/Password authentication (more providers can be added)  
- Session state managed in `LoginViewModel.swift`  
- Displays basic error messages for failed logins  

To use:  
1. Enable Email/Password login in Firebase Console  
2. Replace `GoogleService-Info.plist`  
3. Build and run the app  

## 🧪 Testing

Includes both Unit Tests and UI Tests.  
- Unit tests: Validate logic in `QuranTests/`  
- UI tests: Interaction flows in `QuranUITests/`  

### Run Tests  
- Use `Cmd + U` or navigate to Product > Test in Xcode  

## 🎯 Development Practices

- Uses MVVM for clean separation between logic and UI  
- Custom `IdentifiableError` struct for SwiftUI error popups  
- `LoadingOverlay` SwiftUI view for consistent UX during network calls  
- Firebase integration with modular and reusable ViewModels  

## 🔧 Future Improvements

- 🔍 Surah and Ayah search  
- 🌙 Dark mode and theming options  
- 📚 Translations and Tafsir  
- 🗂 Bookmarking and notes  
- 📶 Offline mode and caching  
- 🧭 Audio recitations  

## 🛡 License

This project is licensed under the MIT License. See the LICENSE file for details.

## 🙌 Contributing

We welcome contributions! Please follow the steps below to contribute:

1. Fork the repository  
2. Create your feature branch: `git checkout -b feature/YourFeature`  
3. Commit your changes: `git commit -am 'Add feature'`  
4. Push to the branch: `git push origin feature/YourFeature`  
5. Open a Pull Request  

## 👤 Author

**Aayush Raghuvanshi**  
- GitHub: [@aayushstackui]([https://github.com/your-github-handle](https://github.com/aayushstackui))  
- Email: raghuvanshiaayush9999@gmail.com  


*Crafted with 🕌 and 🧑‍💻 using SwiftUI, Firebase, and Xcode.*

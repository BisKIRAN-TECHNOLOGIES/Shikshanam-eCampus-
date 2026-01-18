# Nepal Loksewa Exam Preparation Platform - Flutter

A professional, modern Nepal Loksewa Exam Preparation mobile and web application built with Flutter.

## 🎨 Features

- **Beautiful UI/UX** - Professional design with smooth animations
- **Cross-Platform** - Runs on iOS, Android, and Web
- **Consistent Design System** - Professional spacing, colors, and typography
- **Dark Mode Support** - Full light and dark theme support
- **Responsive** - Optimized for iPhone 16 Pro Max and web browsers
- **Professional Animations** - Smooth fade-in, slide-up transitions

## 📱 Screens Included

### Student App
- ✅ **Home Screen** - Dashboard with stats, quick access, live classes, learning progress
- ✅ **Zoom Classes** - Live and recorded class management
- 🚧 **Practice Tests** - MCQ tests, mock exams, progress tracking
- 🚧 **Study Library** - Notes, videos, books, PDFs
- 🚧 **Analytics** - Performance tracking and insights
- 🚧 **Profile** - User settings and preferences
- 🚧 **Notifications** - Real-time updates

### Admin Dashboard
- 🚧 Coming soon

## 🎨 Design System

### Colors
- **Primary**: `#2563eb` (Blue)
- **Accent**: `#f97316` (Orange)
- **Success**: `#10b981` (Green)
- **Error**: `#ef4444` (Red)
- **Warning**: `#f59e0b` (Amber)

### Spacing (8px base)
```
4px  - space1
8px  - space2
12px - space3
16px - space4 (Standard)
20px - space5
24px - space6
32px - space8
```

### Border Radius
```
6px  - radiusXs
10px - radiusSm
14px - radiusMd
18px - radiusLg (Standard)
22px - radiusXl
28px - radius2xl
```

### Typography
- Display: 30-36px (Bold)
- Headline: 18-20px (Semibold)
- Body: 14-16px (Regular)
- Caption: 10-12px (Regular)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK
- Android Studio / Xcode (for mobile)
- Chrome (for web)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd flutter
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run on different platforms**

**Mobile (iOS/Android)**
```bash
flutter run
```

**Web**
```bash
flutter run -d chrome
```

**Specific device**
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

### Building for Production

**Android APK**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── providers/
│   └── app_state.dart       # Global state management
├── screens/
│   ├── student_app.dart     # Student app container
│   ├── admin_dashboard.dart # Admin dashboard
│   └── student/
│       ├── home_screen.dart
│       ├── zoom_classes_screen.dart
│       ├── practice_tests_screen.dart
│       ├── study_library_screen.dart
│       └── analytics_screen.dart
├── theme/
│   └── app_theme.dart       # App theme configuration
└── widgets/
    └── animated_card.dart   # Reusable animated card widget
```

## 🎯 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1           # State management
  google_fonts: ^6.1.0       # Custom fonts
  go_router: ^13.0.0         # Navigation (optional)
  intl: ^0.19.0              # Internationalization
```

## 🌐 Web Deployment

### Deploy to Firebase Hosting
```bash
# Build for web
flutter build web --release

# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting

# Deploy
firebase deploy
```

### Deploy to GitHub Pages
```bash
# Build for web
flutter build web --release --base-href "/repository-name/"

# Copy build to docs folder
cp -r build/web/* docs/

# Commit and push
git add docs
git commit -m "Deploy to GitHub Pages"
git push
```

## 📱 Mobile Deployment

### Android
1. Update `android/app/build.gradle` with signing config
2. Generate keystore
3. Build release APK
4. Upload to Google Play Console

### iOS
1. Configure signing in Xcode
2. Update `ios/Runner.xcodeproj`
3. Build archive
4. Upload to App Store Connect

## 🎨 Customization

### Change Colors
Edit `lib/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF2563eb);
static const Color accentColor = Color(0xFFf97316);
```

### Change Fonts
Edit `lib/theme/app_theme.dart`:
```dart
textTheme: TextTheme(
  displayLarge: GoogleFonts.poppins(...),
  // ...
)
```

### Add New Screens
1. Create screen file in `lib/screens/student/`
2. Add route in `lib/providers/app_state.dart`
3. Import and use in `student_app.dart`

## 🐛 Troubleshooting

### Common Issues

**1. Build fails on web**
```bash
flutter clean
flutter pub get
flutter build web
```

**2. Hot reload not working**
```bash
# Restart the app
r

# Hot restart
R
```

**3. Dependencies conflict**
```bash
flutter pub upgrade
```

## 📄 License

This project is licensed under the MIT License.

## 👥 Contributors

- Your Name - Initial work

## 🙏 Acknowledgments

- Flutter Team
- Material Design
- Apple Human Interface Guidelines
- Nepal Loksewa Aayog

---

**Note**: This is a professional template. You can extend it with:
- Backend integration (Firebase, Supabase)
- Real-time features (WebSockets)
- Payment integration
- Push notifications
- Analytics tracking
- And more!

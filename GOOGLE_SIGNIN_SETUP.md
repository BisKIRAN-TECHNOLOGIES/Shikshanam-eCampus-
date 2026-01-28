# Google Sign-In Setup Guide

This document explains how Google Sign-In has been integrated into the Shikshanam eCampus application.

## Overview

The application now requires users to sign in with their Google account before accessing the main features. This provides secure authentication and a better user experience.

## Configuration

### OAuth Client IDs

The following OAuth client IDs have been configured:

- **Android**: `462381335611-65kl9i78fdss06lvq6cof6mqssqvt6pi.apps.googleusercontent.com`
- **Web**: `462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com`

### Package Used

- `google_sign_in: ^7.2.0`

## Implementation Details

### 1. Google Auth Service (`lib/services/google_auth_service.dart`)

A singleton service that handles all Google Sign-In operations:

- **signIn()**: Initiates the Google Sign-In flow
- **signOut()**: Signs out the current user
- **signInSilently()**: Attempts to sign in without user interaction (for returning users)
- **isSignedIn()**: Checks if a user is currently signed in
- **getUserEmail()**, **getUserDisplayName()**, **getUserPhotoUrl()**: Retrieve user information

### 2. Login Screen (`lib/screens/google_login_screen.dart`)

A beautiful, animated login screen featuring:

- Gradient background with smooth animations
- Fade and slide transitions
- Google Sign-In button with loading states
- Automatic silent sign-in for returning users
- Error handling with user-friendly messages

### 3. App State Management

The `AppState` provider has been updated to track authentication status:

- `isLoggedIn`: Boolean flag indicating if the user is authenticated
- `setLoggedIn(bool)`: Method to update the login state

### 4. Main App Flow

The app now follows this flow:

1. **App Launch** → Shows Google Login Screen
2. **Successful Login** → Shows Student/Admin Dashboard
3. **Logout** → Returns to Google Login Screen

### 5. Logout Functionality

Users can log out from the Profile screen:

- Tap the "Log Out" button
- Confirm logout in the dialog
- Signs out from Google and returns to login screen

## Android Configuration

### strings.xml

The Android OAuth client ID is stored in:
`android/app/src/main/res/values/strings.xml`

```xml
<string name="default_web_client_id">462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com</string>
```

### SHA-1 Certificate Fingerprint

**Important**: For Android to work properly, you need to add your SHA-1 certificate fingerprint to the Google Cloud Console:

1. Get your SHA-1 fingerprint:
   ```bash
   # For debug keystore
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
   
   # For Windows
   keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
   ```

2. Go to [Google Cloud Console](https://console.cloud.google.com/)
3. Select your project
4. Navigate to "APIs & Services" → "Credentials"
5. Click on your Android OAuth client ID
6. Add the SHA-1 fingerprint under "SHA-1 certificate fingerprints"

## Web Configuration

For web platforms, the web client ID is automatically used when running on web:

```dart
clientId: kIsWeb 
    ? '462381335611-f5al04d6pusp5kml8j89fmkr3mnqekmd.apps.googleusercontent.com'
    : null,
```

## Testing

### To test the login flow:

1. Run the app: `flutter run`
2. The Google Login screen should appear
3. Tap "Continue with Google"
4. Select a Google account
5. Grant permissions
6. You should be redirected to the main app

### To test logout:

1. Navigate to the Profile screen (last tab in bottom navigation)
2. Scroll down to the "Log Out" button
3. Tap it and confirm
4. You should be returned to the login screen

## Troubleshooting

### Common Issues

1. **"Sign in failed" error on Android**
   - Ensure SHA-1 fingerprint is added to Google Cloud Console
   - Verify the Android OAuth client ID is correct
   - Check that the package name matches in Google Cloud Console

2. **Web sign-in not working**
   - Verify the web client ID is correct
   - Check browser console for errors
   - Ensure authorized JavaScript origins are configured in Google Cloud Console

3. **Silent sign-in not working**
   - This is normal for first-time users
   - Only works for users who have previously signed in

## Files Modified/Created

### Created:
- `lib/services/google_auth_service.dart` - Google Sign-In service
- `lib/screens/google_login_screen.dart` - Login UI
- `android/app/src/main/res/values/strings.xml` - Android OAuth config

### Modified:
- `pubspec.yaml` - Added google_sign_in dependency
- `lib/main.dart` - Integrated login flow
- `lib/providers/app_state.dart` - Added authentication state
- `lib/screens/student/profile_screen.dart` - Added logout functionality

## Security Notes

- OAuth client IDs are safe to include in the codebase
- Never commit client secrets to version control
- The app uses OAuth 2.0 for secure authentication
- User credentials are never stored locally

## Next Steps

Consider implementing:

1. **User Profile Integration**: Display actual Google user info in the profile screen
2. **Backend Integration**: Send the Google ID token to your backend for verification
3. **Offline Support**: Cache user data for offline access
4. **Additional Providers**: Add Facebook, Apple, or email/password authentication
5. **Role-Based Access**: Use Google account info to determine user roles (student/admin)

## Support

For issues or questions, contact BisKIRAN Technologies support.

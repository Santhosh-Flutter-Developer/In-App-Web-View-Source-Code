# 🖥️ InApp WebView Flutter App

This is a Flutter application that demonstrates how to implement an **In-App WebView** without using external plugins. This project is designed to provide a seamless in-app browsing experience within your Flutter app, ensuring full control over the web view behavior and functionality.

## 🛠️ Features
- **Custom In-App WebView**: An in-app browser implemented without third-party plugins.
- **Navigation Controls**: Users can navigate backward, forward, or refresh the page.
- **Progress Bar**: Displays loading progress for web pages.
- **Error Handling**: Custom error messages for failed web page loads.
- **Cross-Platform Support**: Available on both Android and iOS and Web.
- **Minimal Plugin Usage**: Avoids external libraries to keep the app lightweight.

## 📱 Screenshots
![Apple iPhone 11 Pro Max Presentation (4)](https://github.com/user-attachments/assets/b2edd3f6-bc1d-4301-8eac-cecdc78f29a9)



## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Santhosh-Flutter-Developer/In-App-Web-View-Source-Code.git

2. Navigate to the project directory:

   ```bash
   cd inapp-webview-flutter

3. Get the dependencies:

   ```bash
   flutter pub get

4. Run the app:

   ```bash
   flutter run

## 📚 Usage
WebView Implementation
- The web view in this app is implemented using native Android and iOS WebViews, bypassing the need for plugins like webview_flutter.
- You can customize the URL, controls, and error handling logic as per your requirement.

## How It Works
1. Android: Uses WebView in the Android native layer.
2. iOS: Uses WKWebView in the iOS native layer.
Both platforms communicate via Flutter’s platform channels to manage the web view.

## Requirements
- Flutter SDK version 3.0.0 or later
- Android Studio / Xcode

## 🧑‍💻 Author
Santhosh Sivakumar - [website](http://santhoshsivakumar.liveblog365.com/) | [LinkedIn](https://www.linkedin.com/in/santhosh-flutter-developer/)

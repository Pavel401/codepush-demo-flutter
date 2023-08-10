# Code Push for Flutter: Update Your App Without a New Release using Shorebird




## Introduction

**Code Push** is a revolutionary technique that empowers developers to deliver new code, assets, and even UI changes directly to a running app. Unlike traditional updates that necessitate users to download complete new versions from app stores, **Code Push** selectively updates only the required components, thereby minimizing disruptions instantly.

## Advantages of Code Push Technology

1. **Faster Updates:** With CodePush, developers can swiftly roll out code updates without undergoing the time-consuming app store approval process. This results in expedited delivery of bug fixes, enhancements, and new features to users.

2. **Immediate Bug Fixes:** Critical bugs discovered post-app publication can be promptly rectified and deployed using CodePush, minimizing user inconvenience.

3. **Reduced User Friction:** Users are no longer required to manually update their apps from app stores, enhancing user experience and promoting the adoption of the latest app version.

4. **Hot Fixes:** For urgent matters such as security vulnerabilities or major bugs, CodePush empowers developers to release fixes instantly, bypassing the need for app store approval.

## Shorebird: A Cloud Service for Seamless Updates

**Shorebird** is a pioneering cloud service that enables developers to effortlessly push app updates directly to users' devices. It was founded by prominent contributors to the Flutter world:

- **Eric Seidel:** Founder of Flutter & former Director of Engineering for Flutter/Dart at Google.
- **Felix Angelov:** Creator of Bloc & Mason. Former Principle Engineer at Very Good Ventures.
- **Bryan Oltman:** Former architecture lead for Google’s internal-facing enterprise Flutter team.

## Shorebird Architecture

Shorebird comprises three main components:

1. A command-line tool for building and deploying your app.
2. A modified Flutter engine to include in your app.
3. Servers hosting patches for your app.

For an in-depth understanding of Shorebird's architecture, refer to [this page](https://shorebird.dev/docs/architecture).

## Demo App

A **demo app** has been created to illustrate the power of Shorebird and CodePush. In its initial release, basic logic and assets were added. The second release, facilitated by Shorebird, introduced the Bounce() animation on Fab Tap and a toggle for material 3. To explore the demo app, visit the [GitHub repository](https://github.com/Pavel401/codepush-demo-flutter).

## Getting Started with Shorebird

Follow these steps to start utilizing Shorebird in your Flutter projects:

1. **Install Shorebird CLI:**
    - For macOS/Linux, run:
      ```
      curl --proto '=https' --tlsv1.2 https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh -sSf | bash
      ```
    - For Windows, use:
      ```
      Set-ExecutionPolicy RemoteSigned -scope CurrentUser
      iwr -UseBasicParsing 'https://raw.githubusercontent.com/shorebirdtech/install/main/install.ps1' | iex
      ```

2. **Verify Installation:**
    Run `shorebird doctor` to ensure proper setup.

3. **Create an Account:**
    Execute the following command, follow the link in the output, and sign up with a Google account.
    ```
    shorebird doctor
    ```

4. **Initiate a Project:**
    In your Flutter project's root directory, run:
    ```
    shorebird init
    ```
    This generates a unique app_id for your app, creates a `shorebird.yaml` file, and updates your `pubspec.yaml` to include the `shorebird.yaml` in the assets section.

5. **Add Internet Permission:**
    Update your `android/app/src/main/AndroidManifest.xml` to include the INTERNET permission:

    ```xml
    <manifest ...>
        <uses-permission android:name="android.permission.INTERNET" />
        ...
    </manifest>
    ```

6. **Run Your Project:**
    Execute:
    ```
    shorebird run
    ```

7. **Build and Release:**
    Build your application with:
    ```
    shorebird release android
    ```
    To obtain the APK file, run:
    ```
    shorebird build apk
    ```

8. **Install and Patch:**
    Install the app on your device and launch it. For code changes, use:
    ```
    shorebird patch android
    ```

## Conclusion

**Shorebird** presents an innovative solution to update Flutter apps seamlessly using CodePush technology. To enhance your production apps, explore the capabilities of Shorebird at [shorebird.dev](https://shorebird.dev/).

## Connect with the Author

- [GitHub](https://github.com/mabudalamsaad)
- [LinkedIn](https://www.linkedin.com/in/mabudalamsaad/)

If you found value in this article, consider giving it a star on [GitHub](https://github.com/mabudalamsaad).

---


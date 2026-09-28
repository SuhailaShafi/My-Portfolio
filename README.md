# Suhaila Parvin — Flutter Mobile Developer Portfolio

A professional, recruiter-ready mobile portfolio application built with **Flutter**, **Dart**, **BLoC state management**, **Hive local database**, and **Clean Architecture**.

Designed for iOS and Android platforms to demonstrate high-level Flutter engineering skills, responsive UI design, local storage persistence, and robust state management.

---

## 📱 Features

- **Home Screen**: Hero developer section, profile avatar badge, job title badge, intro summary, social media links, quick stats metrics, and portfolio quick-action cards.
- **About Me**: Professional summary, computer science degree credentials (**B.Tech in Computer Science and Engineering** from **MES College of Engineering, Kuttippuram**), development experience summary, interests, and career focus.
- **Categorized Skills Stack**: Skill chips grouped across:
  - *Flutter & Mobile*: Flutter, Dart, Android, iOS
  - *State Management*: BLoC, Provider, GetX
  - *Backend & Storage*: Firebase, REST API, Hive, JSON
  - *Tools & Deployment*: Git, GitHub, Xcode, App Store, Play Store
- **Work Experience Timeline**: Interactive career trajectory timeline covering:
  - **Ontrends** (Flutter Developer, Oman): Food delivery and e-commerce application using Flutter, Dart, Firebase, Firestore, Firebase Auth, Firebase Storage, GetX, Hive, Localization, and Git.
  - **Supportta Solutions** (Flutter Developer): Flutter application development, state management, REST API integration, and AI-assisted development tools.
  - **Webarclight** (Flutter Developer): iOS deployment, Xcode, App Store submission, and Info.plist deployment troubleshooting.
  - **Zeolans Technologies** (Android Developer): Native Android app development (Java), e-commerce applications, hospital management apps, and social media platforms.
- **Completed Projects Showcase**:
  - **Project 1 — Ontrends Food & E-commerce**: Food, grocery, and essential delivery app with user authentication, food browsing, grocery shopping, cart, orders, delivery tracking, and localization.
  - **Project 2 — AskMyDok**: Healthcare tele-health platform for doctor search, appointment scheduling, tele-consultation video calls, and digital health records.
  - **Project 3 — Flutter Portfolio App**: This self-referential portfolio application demonstrating Flutter development, BLoC state management, Hive local storage, responsive UI, reusable widgets, theme management, and clean project architecture.
  - Conditional store/repo buttons (**GitHub**, **Google Play Store**, **Apple App Store**) that render strictly when a valid URL exists.
- **Contact Channels**: Instant external launchers for **Email** (`mailto:`), **Phone** (`tel:`), **WhatsApp** (`https://wa.me/`), **GitHub**, and **LinkedIn** using `UrlLauncherService`, plus a direct email message form.
- **Settings & Theme Persistence**: Switch between **Light Theme**, **Dark Theme**, and **System Theme**. Preferences are saved in **Hive local storage** and managed reactively via `ThemeBloc`.

---

## 🏗 Architecture & Design Flow

The application follows **Clean Architecture** principles, separating data layers from state logic and presentation widgets:

```
UI (Widgets & Pages)
        │
        ▼
   BLoC Layer (ThemeBloc, ProjectsBloc)
        │
        ▼
Repository Layer (ThemeRepository, PortfolioRepository)
        │
        ▼
Hive Service (Hive Local Database Box Storage)
```

---

## 🛠 Packages Used

- `flutter_bloc`: `^9.1.1` — Reactive state management without Provider/GetX.
- `equatable`: `^2.1.0` — Value-based object equality for events and states.
- `hive`: `^2.2.3` — Fast, lightweight NoSQL key-value database.
- `hive_flutter`: `^1.1.0` — Flutter extension for Hive initialization.
- `url_launcher`: `^6.3.2` — Cross-platform URL scheme launcher.
- `path_provider`: `^2.1.6` — Directory locator for local persistence.

---

## 🚀 How to Run the Application

### Prerequisites
- Flutter SDK `^3.44.0` or higher
- Dart SDK `^3.12.0` or higher

### Steps

1. **Clone or navigate to the project directory**:
   ```bash
   cd my_portfolio
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Format & Analyze codebase**:
   ```bash
   dart format .
   flutter analyze
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 👤 Developer Profile

- **Name**: Suhaila Parvin
- **Role**: Flutter Developer
- **Degree**: B.Tech in Computer Science and Engineering (MES College of Engineering, Kuttippuram)
- **GitHub**: [https://github.com/suhailaparvin](https://github.com/suhailaparvin)
- **LinkedIn**: [https://linkedin.com/in/suhailaparvin](https://linkedin.com/in/suhailaparvin)

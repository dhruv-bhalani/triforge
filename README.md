# 🚀 Triforge Infotech - Flutter App

Next-Gen IT Company Website built with Flutter + GetX + Provider

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── bindings/
│   ├── initial_binding.dart     # Global bindings
│   ├── home_binding.dart        # Home page bindings
│   └── contact_binding.dart     # Contact page bindings
├── controllers/
│   ├── navigation_controller.dart   # Navigation state
│   ├── home_controller.dart         # Home page animations
│   ├── contact_controller.dart      # Contact form logic
│   └── theme_controller.dart        # Theme management
├── views/
│   ├── home/home_page.dart          # Home page with hero
│   ├── about/about_page.dart        # About us page
│   ├── services/services_page.dart  # Services page
│   └── contact/contact_page.dart    # Contact page with form
├── widgets/
│   ├── app_navbar.dart              # Navigation bar
│   ├── particle_background.dart     # Animated particles
│   ├── glow_card.dart               # Animated cards
│   ├── section_title.dart           # Section headers
│   └── app_footer.dart              # Footer
└── utils/
    ├── app_theme.dart               # Colors & theme
    ├── app_routes.dart              # Route definitions
    └── app_constants.dart           # Company data
```

## 🛠️ Setup Instructions

### 1. Prerequisites
- Flutter SDK 3.10.0+
- Dart 3.0.0+
- Android Studio / VS Code

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
# Debug mode
flutter run

# Release APK
flutter build apk --release

# Web
flutter build web
```

## 📦 Key Packages Used

| Package | Purpose |
|---------|---------|
| `get: ^4.6.6` | State management & navigation |
| `provider: ^6.1.2` | Provider pattern |
| `animate_do: ^3.3.4` | Fade/slide animations |
| `flutter_animate: ^4.5.0` | Advanced animations |
| `google_fonts: ^6.2.1` | Orbitron & Space Grotesk fonts |
| `flutter_screenutil: ^5.9.0` | Responsive UI |
| `url_launcher: ^6.3.0` | Phone, email, WhatsApp |

## 📱 Features

- ✅ **Home Page** - Animated hero, floating cards, stats, services preview
- ✅ **About Page** - Company story, team, values, mission & vision
- ✅ **Services Page** - Detailed services, process steps, tech stack
- ✅ **Contact Page** - Form with validation, click-to-call, WhatsApp, email
- ✅ **Particle Animation** - Floating particles in background
- ✅ **Glow Cards** - Hover-effect glowing cards
- ✅ **Responsive** - Works on mobile, tablet, desktop
- ✅ **GetX Navigation** - Smooth page transitions

## 📞 Contact Info in App
- **Phone**: +91 9099181826
- **Email**: triforgeinfotech@gmail.com  
- **Location**: Surat, Gujarat, India

## 🎨 Color Scheme
- Primary: `#00D4FF` (Cyan Blue)
- Secondary: `#7B2FFF` (Purple)
- Accent: `#FF6B35` (Orange)
- Background: `#050A14` (Dark Navy)

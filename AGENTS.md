# AGENTS.md

## Cursor Cloud specific instructions

### Project Overview
This is **tracker_bloc**, a Flutter mobile/web app that tracks GitLab projects. It connects to an external GitLab API at `https://git.monitorsoft.ru/api/v4/` using a hardcoded bearer token in `lib/dio.dart`. The app uses the BLoC pattern (`flutter_bloc`) for state management.

### Flutter SDK
- Requires **Flutter 3.7.x** (Dart SDK `>=2.14.0 <3.0.0`). Flutter 3.10+ ships Dart 3.x and is **not compatible**.
- Flutter is installed at `/home/ubuntu/flutter` and added to PATH via `~/.bashrc`.
- Web support must be enabled: `flutter config --enable-web`.

### Key Commands
- **Install deps:** `flutter pub get`
- **Lint:** `flutter analyze` — expects `package:flutter_lints/flutter.yaml` (not in dev_dependencies; produces a warning — this is a pre-existing issue).
- **Test:** `flutter test` — the default widget test (`test/widget_test.dart`) is boilerplate for a counter app and does not match the actual tracker app, so it will fail. This is pre-existing.
- **Run (web):** `flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0` or build with `flutter build web` and serve `build/web/`.
- **Run (web, release):** `flutter build web --release --web-renderer html` then serve `build/web/` (e.g. `python3 -m http.server 8080 -d build/web`).

### Gotchas
- The app depends on an external GitLab API (`git.monitorsoft.ru`) which may not be reachable from cloud environments. The app will load and render correctly but the "get" button will show a loading spinner indefinitely if the API is unreachable.
- The `pubspec.lock` uses the old `pub.dartlang.org` URL format, which is compatible with Flutter 3.7.x but may trigger warnings on newer Flutter versions.
- The `analysis_options.yaml` references `package:flutter_lints/flutter.yaml` but `flutter_lints` is not listed in `dev_dependencies`. This causes a warning during `flutter analyze` but does not block development.

<!--
Guidance for automated coding agents working on the Yaru.dart repo.
Keep this short and actionable. Update when CI, golden workflows or build scripts change.
-->

# Copilot / AI agent instructions — yaru.dart

## Quick orientation

- This repository provides a Flutter theme + widget library and a full icon set.
- Public API lives under `lib/` (e.g. `lib/yaru.dart`) while implementation details are in `lib/src/`.
- Icon source SVGs live in `assets/icons/` and the generated font/class is `assets/yaru_icons.otf` / `lib/src/icons/yaru_icons.dart`.

## Where to look first

- Theme and typography: `lib/src/themes/text_theme.dart` (contains `createTextTheme` and `_UbuntuTextStyle`).
- Widget implementations: `lib/src/widgets/` (search for `Yaru*` widgets like `yaru_toggle_button.dart`, `yaru_master_tile.dart`).
- Example app: `example/` — used by CI and for manual testing; many workflows run with `working-directory: example`.
- Icon tooling: `build-icons.sh` and `pubspec.yaml` `icon_font` section. See README for the recommended generator command.

## Essential commands (copyable)

- Build icon font (after editing SVGs):

```bash
./build-icons.sh
```

or

```bash
yaru_icon_font_generator assets/icons assets/yaru_icons.otf --output-class-file=lib/src/icons/yaru_icons.dart -r
```

- Run unit & widget tests (CI uses the example working dir):

```bash
flutter test
```

- Update golden images (used in CI / PR template):

```bash
flutter test --update-goldens
```

## CI & golden notes

- GitHub actions run goldens in a nightly job and run tests in `example/` (see `.github/workflows/ci.yml` and `nightly.yml`).
- Golden helpers live in `test/yaru_golden_tester.dart` and `test/flutter_test_config.dart` (golden_toolkit integration).

## Project-specific patterns and conventions

- Naming: icons are named `subfolder_iconname` and the icon class is generated to `lib/src/icons/yaru_icons.dart`.
- Theme object creation: centralised in `createTextTheme(Color)`; prefer using theme text styles (e.g. `textTheme.bodySmall`) when styling widgets.
- Public surface: `lib/yaru.dart` and top-level files (constants, theme, widgets) re-export the public API; prefer editing `lib/src/*` for implementation details.
- Tests: many widget tests are golden-based and use `ValueVariant`/`YaruGoldenVariant` helpers; keep visual diffs minimal when changing UI.

## Relationship to Material

- This package builds on top of Flutter's Material library rather than replacing it. Key points:
	- The theme is implemented as a Material `TextTheme`/`ThemeData` variant — see `lib/src/themes/text_theme.dart` (`createTextTheme`) for the canonical defaults (Ubuntu font, sizes like `bodyMedium`).
	- Many widgets are thin, opinionated wrappers around Material building blocks (layouts, semantics, gestures). Look at `lib/src/widgets/yaru_toggle_button.dart` and `lib/src/widgets/master_detail/yaru_master_tile.dart` for examples where DefaultTextStyle, IconTheme and ListTile-like layouts are adapted to Yaru visuals.
	- Other components are custom desktop-focused widgets (title bars, window controls, page indicators) and do not map 1:1 to a single Material widget — see `lib/src/widgets/` for examples.
	- Icons and the icon font are entirely custom; they replace/augment Material icons for the Yaru look (`assets/icons/` → `assets/yaru_icons.otf` and `lib/src/icons/yaru_icons.dart`).

Guidance for agents:
	- Prefer using existing theme values (e.g. `Theme.of(context).textTheme.bodySmall`) so changes stay consistent across widgets.
	- If you change low-level Material defaults, check effect on goldens and example app; many tests assume the theme's text sizes and icon metrics.

## Integration points & external deps

- Flutter SDK: `environment.flutter` in `pubspec.yaml` (>=3.32.0). Use a matching Flutter stable channel locally.
- Native targets: example supports linux/macos/windows via native folders; linux example includes a CMake wrapper that links GTK.
- Native/desktop-specific packages: `yaru_window`, `gtk`, `platform_linux` etc. Be cautious when running tests on CI — use emulator/desktop runners as configured.

## Small, actionable heuristics for an agent

- When changing icons: update `assets/icons/` → run `./build-icons.sh` → commit both `assets/yaru_icons.otf` and `lib/src/icons/yaru_icons.dart` (they are generated).
- When changing theme typography, update `lib/src/themes/text_theme.dart` and search for `DefaultTextStyle.merge` usages in widgets to ensure components inherit new sizes.
- Golden tests: if a PR updates visuals intentionally, include `flutter test --update-goldens` output or update the pngs under the test `goldens/` folders and mention it in the PR.
- If you need to run example code or CI-like checks locally, run commands from repository root but note workflows often `cd example` first.

## Key files to reference quickly

- `README.md` — setup and icon generation notes
- `pubspec.yaml` — fonts, icon_font config, SDK constraints
- `build-icons.sh` — convenience wrapper around the icon generator
- `.github/workflows/ci.yml`, `nightly.yml` — CI behaviour (where tests and golden updates run)
- `test/yaru_golden_tester.dart`, `test/flutter_test_config.dart` — golden test helpers

## For UX / UI designers

This repo contains both code and visual assets that designers will find useful. Quick pointers:

- Icons: source SVGs in `assets/icons/` arranged by category (subfolders). Icon names are generated using the folder + filename (see `pubspec.yaml` `icon_font` naming strategy).
- Typography: default text styles (font family, sizes) are defined in `lib/src/themes/text_theme.dart` — inspect `createTextTheme` to find `bodyMedium`, `labelLarge`, etc.
- Golden images: test goldens live alongside tests under `test/**/goldens/` — update them with `flutter test --update-goldens` and include PR notes when visuals intentionally change.
- Example screens: the `example/` app demonstrates many widgets and is the quickest way to preview components and their states. Use it to validate layout, spacing, and RTL/localization.
- Fonts: Ubuntu font files and the generated `assets/yaru_icons.otf` are in `assets/fonts/` and `assets/` respectively — ensure licensing compatibility before altering.

## If something is missing

- Ask the maintainer for expected CI images (golden baseline) or which generated artifacts should be committed. When unsure about pushing generated assets, prefer asking.

---
Please review this and tell me if you want more emphasis on testing, icon generation, design hints, or CI/publishing steps.

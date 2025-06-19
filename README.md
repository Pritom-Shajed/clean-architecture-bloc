## 📁 Folder Structure (Clean Architecture)

```plaintext
lib/
└── src/
    ├── core/                     # Core utilities, theme, config, etc.
    ├── features/
    │   └── home/                 # Feature: Home/Product List
    │       ├── data/             # Data layer (models, sources, repositories)
    │       │   ├── models/
    │       │   ├── repository/
    │       │   └── sources/
    │       ├── domain/           # Domain layer (entities, repositories, usecases)
    │       │   ├── entities/
    │       │   ├── repository/
    │       │   └── usecase/
    │       └── presentation/     # UI layer (blocs, view)
    │           ├── bloc/
    │           └── view/
    ├── localization/             # localization files
    ├── app.dart
    └── main.dart
```

## 📦 Packages Used

Below is a list of the major packages used in this project:

| Package                                           | Purpose                                                             |
| ------------------------------------------------- | ------------------------------------------------------------------- |
| `flutter_bloc`                                    | State management                                                    |
| `get_it`                                          | Dependency injection                                                |
| `dartz`                                           | Functional programming utilities                                    |
| `logger`                                          | Logging                                                             |
| `go_router`                                       | Declarative routing                                                 |
| `go_transitions`                                  | Transition animations for Go Router                                 |
| `flutter_dotenv`                                  | Load environment variables                                          |
| `hive_ce`, `hive_ce_flutter`, `hive_ce_generator` | Local storage with code generation                                  |
| `intl`                                            | Internationalization and formatting                                 |
| `flutter_easyloading`                             | Customizable loading indicators                                     |
| `flutter_spinkit`                                 | Animated loading spinners                                           |
| `flutter_svg`                                     | SVG image rendering                                                 |
| `url_launcher`                                    | Launch URLs in the device browser or apps                           |
| `dio`                                             | Advanced HTTP client                                                |
| `connectivity_plus`                               | Monitor network connectivity status                                 |
| `freezed`, `freezed_annotation`                   | Immutable data classes and union types                              |
| `fluttertoast`                                    | Toast messages                                                      |
| `cached_network_image`                            | Network image caching                                               |
| `solar_icon_pack`                                 | Icon pack                                                           |
| `build_runner`                                    | Code generation tool                                                |
| `flutter_lints`                                   | Flutter recommended lints                                           |
| `rename_app`, `change_app_package_name`           | Utility packages for renaming the app and changing the package name |
| `form_builder_validators`                         | Form validation utilities                                           |
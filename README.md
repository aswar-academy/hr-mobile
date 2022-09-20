# aswar
simple hr system

## to add new screen or add new feature
using mason_cli
```
dart pub global activate mason_cli
```

add new feature
```
mason make feature
```

## syntax sugar
- access strings
    ```dart
    $strings.helloMessage
    ```
- access theme
    ```dart
    $styles.insets.lg
    ```

## features
- Login
- profile
- home
- add task
- my tasks
- payroll
- department

## uses
- state management [bloc](https://pub.dev/packages/bloc)
- animation [flutter_animate](https://pub.dev/packages/flutter_animate)
- http error handling use [error_handler](https://pub.dev/packages/error_handler)
- json serialization [json_serializable](https://pub.dev/packages/json_serializable)
- localization [flutter_localizations](https://pub.dev/packages/flutter_localizations)
- routing [auto_route](https://pub.dev/packages/auto_route)
- intro screen [auto_route](https://pub.dev/packages/auto_route)
- local storage [shared_preferences](https://pub.dev/packages/shared_preferences)
- safe assets accessØ [flutter_gen](https://pub.dev/packages/flutter_gen)

## TODO
- finish README.md
- split bloc_dio_error_handler
- localize my profile
import 'package:aswar/common_libs.dart';

/// used with data provided by user
///
/// ##Example
///
/// ```dart
/// final value = null;
/// UiState.data(value, fakeResponse);
/// ```
const ResponseValue<dynamic> dynamicResponse = ResponseValue(null, 200);

/// empty data for local data or [Future]
///
/// ##Example
///
/// ```dart
/// UiState value = const UiState.idle();
///
/// Future<void> awaitSomething() async {
///   await Future.delayed(const Duration(seconds: 1));
///   value = emptyData;
/// }
/// ```
const UiState<dynamic> dynamicDataState =
    UiState.data(data: null, response: dynamicResponse);

const UiState<dynamic> dynamicLoadingState = UiState<dynamic>.loading();
typedef LoadingState<T> = Loading<T>;

ResultState<T> emitableData<T>(T data) {
  return ResultState.data(data: data, response: dynamicResponse);
}

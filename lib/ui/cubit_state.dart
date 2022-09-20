// TODO(masreplay): split as package

// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:aswar/common_libs.dart';
import 'package:aswar/ui/result_state_utils.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension CubitApiHandler<DataType> on StateCubit<DataType> {
  Future<void> emitCall(
    FutureResponse<DataType> apiCall, [
    StateChanged<UiState<DataType>>? onData,
  ]) async {
    await const ErrorHandler(logger: stateLogger)
        .stream(apiCall.transform)
        .listen(onData ?? emit)
        .asFuture();
  }
}

class StateCubit<T> extends Cubit<UiState<T>> {
  StateCubit() : super(const UiState.idle());
}

typedef FutureChopperResponse<T> = Future<ChopperHttpResponse<T>>;

typedef FutureResponse<T> = Future<Response<T>>;

typedef StateChanged<T> = void Function(T value);

extension FutureCallCubit<T> on Cubit<T> {
  getFutureAsState(
    FutureOr<void> Function() call,
    void Function(ResultState<dynamic> value) onStateChanged,
  ) async {
    onStateChanged(dynamicLoadingState);
    await call();
    onStateChanged(dynamicDataState);
  }
}

abstract class MultipleState {
  const MultipleState();

  List<ResultState<dynamic>> get states;

  bool get isAllLoading {
    if (states.isEmpty) throw UnsupportedError("add all state to the list");
    return states.any((element) => element.isLoading);
  }
}


// extension MultiCubitApiHandler<DataType, MultiState> on Cubit<MultiState> {
//   Future<void> emitCall(
//     Future<Response<DataType>> apiCall, [
//     StateChanged<ResultState<DataType>>? onData,
//   ]) async {
//     await errorHandler.stream(apiCall.transform).listen(onData).asFuture();
//   }
// }


// ## Dart Suggestion
//
// tear-off selection
//
// await getDynamicState(
//       getIt<RegistrationPreference>().clearData,
//       (value) {state.copyWith(logout:)},
// );

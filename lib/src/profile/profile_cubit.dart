import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:aswar/ui/result_state_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void _emitUserState(UserState event) {
    emit(state.copyWith(user: event));
  }

  Future<void> getProfile() async {
    final localUser = emitableData($registrationPreference.getData()!.user);

    _emitUserState(localUser);
    await errorHandler
        .stream($client.authProfileGet().transform)
        .listen(_emitUserState)
        .asFuture();
  }

  Future<void> logout() => getFutureAsState(
        $registrationPreference.clearData,
        (value) => state.copyWith(logout: value),
      );
}

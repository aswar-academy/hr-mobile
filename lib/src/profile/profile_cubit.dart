import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile() => errorHandler
      .stream($client.authProfileGet().transform)
      .listen((event) => emit(state.copyWith(user: event)))
      .asFuture();

  Future<void> logout() async {
    await getDynamicState(
      $registrationPreference.clearData,
      (value) => state.copyWith(logout: value),
    );
  }
}

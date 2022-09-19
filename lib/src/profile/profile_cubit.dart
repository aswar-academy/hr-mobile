import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile() => errorHandler
      .stream($client.authProfileGet().transform)
      .listen((event) => emit(state.copyWith(userState: event)))
      .asFuture();

  Future<void> logout() async {
    await getIt<RegistrationPreference>().clearData();
  }
}

import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile() async {
    final user = await $client.authProfileGet();
    print(user.body);
    return errorHandler
        .stream($client.authProfileGet().transform)
        .listen((event) {})
        .asFuture();
  }

  Future<void> logout() => getDynamicState(
        getIt.get<RegistrationPreference>().clearData,
        (value) => state.copyWith(logout: value),
      );
}

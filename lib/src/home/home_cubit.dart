import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/src/home/user_detail_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final RegistrationPreference preference;
  HomeCubit(this.preference) : super(const HomeState.idle());

  Future<void> getHomeData() async {
    final registration = preference.getData()!;
    await getHome(registration.user).listen(emit).asFuture();
  }
}

Stream<HomeState> getHome(UserDetail user) async* {
  final homeData = HomeData(
    user: user,
    tasksCount: user.tasksCount,
    lastAttendance: Attendance(
      id: 1,
      createdAt: DateTime.now(),
      departureTime: DateTime.now(),
      userId: user.id,
    ),
  );

  yield const ResultState.loading();
  await Future.delayed(const Duration(seconds: 1));
  yield ResultState.data(
    data: homeData,
    response: ResponseValue(homeData, 200),
  );
}

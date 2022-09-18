import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final RegistrationPreference preference;
  HomeCubit(this.preference) : super(const HomeState.idle());

  Future<void> getHomeData() async {
    final user = preference.getData()!.user;
    final homeData = HomeData(
      user: user,
      tasksCount: const TasksCount(doing: 1, todo: 2, done: 2),
      lastAttendance: Attendance(
        id: 1,
        createdAt: DateTime.now(),
        departureTime: DateTime.now(),
        userId: user.id,
      ),
    );
    emit(const ResultState.loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(
      ResultState.data(
        data: homeData,
        response: ResponseValue(homeData, 200),
      ),
    );
  }
}

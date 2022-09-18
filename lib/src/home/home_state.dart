import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:error_handler/error_handler.dart';

typedef HomeState = UiState<HomeData>;

class HomeData {
  final UserDetail user;
  final TasksCount tasksCount;
  final Attendance lastAttendance;

  const HomeData({
    required this.user,
    required this.tasksCount,
    required this.lastAttendance,
  });
}

class TasksCount {
  final int doing;
  final int done;
  final int todo;

  const TasksCount(
      {required this.doing, required this.done, required this.todo,});
}

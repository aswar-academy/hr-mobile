import 'package:aswar/swagger_generated_code/openapi.swagger.dart';

extension UserDetailExtension on UserDetail {
  TasksCount get tasksCount {
    int getCount(TaskState state) {
      return tasks.where((element) => element.state == TaskState.doing).length;
    }

    return TasksCount(
      doing: getCount(TaskState.doing),
      done: getCount(TaskState.done),
      todo: getCount(TaskState.todo),
    );
  }
}

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

  const TasksCount({
    required this.doing,
    required this.done,
    required this.todo,
  });
}

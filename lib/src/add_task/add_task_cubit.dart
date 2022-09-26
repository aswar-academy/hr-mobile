import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:bloc_error_handler/bloc_error_handler.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddTaskCubit extends StateCubit<Task> {
  Future<void> addTask(CreateTask body) =>
      emitCall($client.tasksPost(body: body));
}

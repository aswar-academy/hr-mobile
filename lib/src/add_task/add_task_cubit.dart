import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddTaskCubit extends StateCubit<Task> {
  Future<void> addTask(CreateTask body) =>
      emitCall($client.tasksPost(body: body));
}

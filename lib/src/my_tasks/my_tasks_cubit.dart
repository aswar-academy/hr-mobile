import 'package:aswar/main.dart';
import 'package:bloc_error_handler/bloc_error_handler.dart';
import 'package:injectable/injectable.dart';

import 'my_tasks_state.dart';

@injectable
class MyTasksCubit extends StateCubit<MyTasksStateType> {
  Future<void> getList() => emitCall($client.tasksGet());
}

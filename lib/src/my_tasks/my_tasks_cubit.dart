import 'package:aswar/main.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:injectable/injectable.dart';

import 'my_tasks_state.dart';

@injectable
class MyTasksCubit extends StateCubit<MyTasksStateType> {
  Future<void> getList() => emitCall($client.tasksGet());
}

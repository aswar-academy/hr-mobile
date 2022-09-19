import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'my_tasks_state.dart';

@injectable
class MyTasksCubit extends Cubit<MyTasksState> {
  

  MyTasksCubit(
    ): super(const MyTasksState.idle());


  
}

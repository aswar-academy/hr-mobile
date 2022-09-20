import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'my_department_state.dart';

@injectable
class MyDepartmentCubit extends Cubit<MyDepartmentState> {
  MyDepartmentCubit() : super(const MyDepartmentState.idle());
}

import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.idle());

  Future<void> login(Login data) => errorHandler
      .stream($client.authLoginPost(body: data).transform)
      .listen(emit)
      .asFuture();
}

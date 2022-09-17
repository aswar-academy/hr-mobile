import 'package:aswar/common_libs.dart';
import 'package:aswar/logic/login/login_filter.dart';
import 'package:aswar/main.dart';

typedef LoginState = ResultState<Registration>;

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState.idle());

  Future<void> login(Login loginData) async {
    errorHandler.stream(
      $client.authLoginPost(body: loginData).transform,
      dataFilters: [AdminRoleDataFilter()],
    ).listen((event) => state = event);
  }
}

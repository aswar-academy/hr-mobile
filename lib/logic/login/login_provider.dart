import 'package:aswar/common_libs.dart';
import 'package:aswar/logic/login/login_filter.dart';
import 'package:aswar/main.dart';

typedef LoginState = ResultState<Registration>;



final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref),
);

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  // ignore: prefer_const_constructors
  LoginNotifier(this.ref) : super(LoginState.idle());

  Future<void> login(Login loginData) async {
    await errorHandler.stream(
      $client.authLoginPost(body: loginData).transform,
      dataFilters: [AdminRoleDataFilter()],
    ).listen((event) {
      state = event;
      print("pts state $event");
    }).asFuture();
  }
}

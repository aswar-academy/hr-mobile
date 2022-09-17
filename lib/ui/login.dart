import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';

const adminRoleNotAllowed = DefinedException(tag: "adminRoleNotAllowed");

class AdminRoleDataFilter extends DataFilter<Registration> {
  @override
  ResultState<Registration>? handle(Registration data, ResponseValue response) {
    if (data.user.role == UserDetailRole.admin) {
      return adminRoleNotAllowed.getResultState();
    }
    return null;
  }
}

typedef LoginState = ResultState<Registration>;

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState.idle());

  void login(Login loginData) {
    $client.authLoginPost(body: loginData);

    errorHandler.stream(
      $client.authLoginPost(body: loginData).transform,
      dataFilters: [AdminRoleDataFilter()],
    );
  }
}

import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:error_handler/error_handler.dart';

part "profile_state.g.dart";

typedef UserState = UiState<UserDetail>;
typedef LogoutState = UiState<dynamic>;

@CopyWith()
class ProfileState {
  final UserState user;
  final LogoutState logout;

  const ProfileState({
    this.user = const UserState.idle(),
    this.logout = const LogoutState.idle(),
  });
}

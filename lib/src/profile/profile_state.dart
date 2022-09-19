// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:error_handler/error_handler.dart';

part "profile_state.g.dart";

typedef UserState = UiState<UserDetail>;
typedef LogoutState = UiState<dynamic>;

@CopyWith()
class ProfileState {
  final UserState userState;
  final LogoutState logoutState;

  const ProfileState({
    this.userState = const UserState.idle(),
    this.logoutState = const LogoutState.idle(),
  });
}

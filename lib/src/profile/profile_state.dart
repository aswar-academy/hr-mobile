import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:aswar/ui/cubit_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:error_handler/error_handler.dart';

part "profile_state.g.dart";

typedef UserState = ResultState<UserDetail>;

typedef LogoutState = ResultState<dynamic>;

// error with copy with package generation if i use typedef
@CopyWith()
class ProfileState extends MultipleState {
  final ResultState<UserDetail> user;
  final LogoutState logout;

  const ProfileState({
    this.user = const ResultState<UserDetail>.idle(),
    this.logout = const LogoutState.idle(),
  });

  @override
  List<ResultState> get states => [user, logout];
}

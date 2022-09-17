import 'package:aswar/common.dart';
import 'package:aswar/common_libs.dart';

const adminRoleNotAllowed = DefinedException(tag: "adminRoleNotAllowed");

class AdminRoleDataFilter extends DataFilter<Registration> {
  @override
  ResultState<Registration>? handle(Registration data, ResponseValue response) {
    if (data.user.role == UserDetailRole.admin) {
      return adminRoleNotAllowed.toResultState();
    }
    return null;
  }
}

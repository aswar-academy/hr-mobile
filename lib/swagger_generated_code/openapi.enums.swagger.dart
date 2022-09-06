import 'package:json_annotation/json_annotation.dart';

enum UsersGetRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin
}

const $UsersGetRoleMap = {
  UsersGetRole.user: 'USER',
  UsersGetRole.admin: 'ADMIN'
};

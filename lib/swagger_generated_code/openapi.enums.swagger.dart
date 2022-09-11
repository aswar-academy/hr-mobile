import 'package:json_annotation/json_annotation.dart';

enum TaskState {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DOING')
  doing,
  @JsonValue('TODO')
  todo,
  @JsonValue('DONE')
  done
}

const $TaskStateMap = {
  TaskState.doing: 'DOING',
  TaskState.todo: 'TODO',
  TaskState.done: 'DONE'
};

enum UserDetailRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin
}

const $UserDetailRoleMap = {
  UserDetailRole.user: 'USER',
  UserDetailRole.admin: 'ADMIN'
};

enum CreateUserRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin
}

const $CreateUserRoleMap = {
  CreateUserRole.user: 'USER',
  CreateUserRole.admin: 'ADMIN'
};

enum UserRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin
}

const $UserRoleMap = {UserRole.user: 'USER', UserRole.admin: 'ADMIN'};

enum CreateTaskState {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DOING')
  doing,
  @JsonValue('TODO')
  todo,
  @JsonValue('DONE')
  done
}

const $CreateTaskStateMap = {
  CreateTaskState.doing: 'DOING',
  CreateTaskState.todo: 'TODO',
  CreateTaskState.done: 'DONE'
};

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

enum TasksIdPatchRole {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DOING')
  doing,
  @JsonValue('TODO')
  todo,
  @JsonValue('DONE')
  done
}

const $TasksIdPatchRoleMap = {
  TasksIdPatchRole.doing: 'DOING',
  TasksIdPatchRole.todo: 'TODO',
  TasksIdPatchRole.done: 'DONE'
};

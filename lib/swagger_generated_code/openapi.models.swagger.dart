// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';
import 'openapi.enums.swagger.dart' as enums;

part 'openapi.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Department {
  Department({
    required this.name,
    required this.id,
    required this.createdAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  static const fromJsonFactory = _$DepartmentFromJson;
  static const toJsonFactory = _$DepartmentToJson;
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Department &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      runtimeType.hashCode;
}

extension $DepartmentExtension on Department {
  Department copyWith({String? name, double? id, DateTime? createdAt}) {
    return Department(
        name: name ?? this.name,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt);
  }

  Department copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<double>? id,
      Wrapped<DateTime>? createdAt}) {
    return Department(
        name: (name != null ? name.value : this.name),
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt));
  }
}

@JsonSerializable(explicitToJson: true)
class Attendance {
  Attendance({
    required this.id,
    required this.createdAt,
    required this.departureTime,
    required this.userId,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  @JsonKey(name: 'departureTime', includeIfNull: false)
  final DateTime departureTime;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double userId;
  static const fromJsonFactory = _$AttendanceFromJson;
  static const toJsonFactory = _$AttendanceToJson;
  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Attendance &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.departureTime, departureTime) ||
                const DeepCollectionEquality()
                    .equals(other.departureTime, departureTime)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(departureTime) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $AttendanceExtension on Attendance {
  Attendance copyWith(
      {double? id,
      DateTime? createdAt,
      DateTime? departureTime,
      double? userId}) {
    return Attendance(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        departureTime: departureTime ?? this.departureTime,
        userId: userId ?? this.userId);
  }

  Attendance copyWithWrapped(
      {Wrapped<double>? id,
      Wrapped<DateTime>? createdAt,
      Wrapped<DateTime>? departureTime,
      Wrapped<double>? userId}) {
    return Attendance(
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        departureTime:
            (departureTime != null ? departureTime.value : this.departureTime),
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class Task {
  Task({
    required this.state,
    required this.title,
    required this.description,
    required this.userId,
    required this.id,
    required this.createdAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @JsonKey(
    name: 'state',
    includeIfNull: false,
    toJson: taskStateToJson,
    fromJson: taskStateFromJson,
  )
  final enums.TaskState state;
  @JsonKey(name: 'title', includeIfNull: false)
  final String title;
  @JsonKey(name: 'description', includeIfNull: false)
  final String description;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double userId;
  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  static const fromJsonFactory = _$TaskFromJson;
  static const toJsonFactory = _$TaskToJson;
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Task &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      runtimeType.hashCode;
}

extension $TaskExtension on Task {
  Task copyWith(
      {enums.TaskState? state,
      String? title,
      String? description,
      double? userId,
      double? id,
      DateTime? createdAt}) {
    return Task(
        state: state ?? this.state,
        title: title ?? this.title,
        description: description ?? this.description,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt);
  }

  Task copyWithWrapped(
      {Wrapped<enums.TaskState>? state,
      Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<double>? userId,
      Wrapped<double>? id,
      Wrapped<DateTime>? createdAt}) {
    return Task(
        state: (state != null ? state.value : this.state),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        userId: (userId != null ? userId.value : this.userId),
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDetail {
  UserDetail({
    required this.email,
    required this.name,
    required this.role,
    required this.jobTitle,
    this.salary,
    required this.departmentId,
    required this.id,
    required this.createdAt,
    required this.department,
    required this.attendance,
    required this.tasks,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
    name: 'role',
    includeIfNull: false,
    toJson: userDetailRoleToJson,
    fromJson: userDetailRoleFromJson,
  )
  final enums.UserDetailRole role;
  @JsonKey(name: 'jobTitle', includeIfNull: false)
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double? salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  @JsonKey(name: 'department', includeIfNull: false)
  final Department department;
  @JsonKey(
      name: 'attendance', includeIfNull: false, defaultValue: <Attendance>[])
  final List<Attendance> attendance;
  @JsonKey(name: 'tasks', includeIfNull: false, defaultValue: <Task>[])
  final List<Task> tasks;
  static const fromJsonFactory = _$UserDetailFromJson;
  static const toJsonFactory = _$UserDetailToJson;
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserDetail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.jobTitle, jobTitle) ||
                const DeepCollectionEquality()
                    .equals(other.jobTitle, jobTitle)) &&
            (identical(other.salary, salary) ||
                const DeepCollectionEquality().equals(other.salary, salary)) &&
            (identical(other.departmentId, departmentId) ||
                const DeepCollectionEquality()
                    .equals(other.departmentId, departmentId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.attendance, attendance) ||
                const DeepCollectionEquality()
                    .equals(other.attendance, attendance)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(jobTitle) ^
      const DeepCollectionEquality().hash(salary) ^
      const DeepCollectionEquality().hash(departmentId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(attendance) ^
      const DeepCollectionEquality().hash(tasks) ^
      runtimeType.hashCode;
}

extension $UserDetailExtension on UserDetail {
  UserDetail copyWith(
      {String? email,
      String? name,
      enums.UserDetailRole? role,
      String? jobTitle,
      double? salary,
      double? departmentId,
      double? id,
      DateTime? createdAt,
      Department? department,
      List<Attendance>? attendance,
      List<Task>? tasks}) {
    return UserDetail(
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        department: department ?? this.department,
        attendance: attendance ?? this.attendance,
        tasks: tasks ?? this.tasks);
  }

  UserDetail copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<enums.UserDetailRole>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double?>? salary,
      Wrapped<double>? departmentId,
      Wrapped<double>? id,
      Wrapped<DateTime>? createdAt,
      Wrapped<Department>? department,
      Wrapped<List<Attendance>>? attendance,
      Wrapped<List<Task>>? tasks}) {
    return UserDetail(
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        role: (role != null ? role.value : this.role),
        jobTitle: (jobTitle != null ? jobTitle.value : this.jobTitle),
        salary: (salary != null ? salary.value : this.salary),
        departmentId:
            (departmentId != null ? departmentId.value : this.departmentId),
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        department: (department != null ? department.value : this.department),
        attendance: (attendance != null ? attendance.value : this.attendance),
        tasks: (tasks != null ? tasks.value : this.tasks));
  }
}

@JsonSerializable(explicitToJson: true)
class Login {
  Login({
    required this.email,
    required this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'password', includeIfNull: false)
  final String password;
  static const fromJsonFactory = _$LoginFromJson;
  static const toJsonFactory = _$LoginToJson;
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginExtension on Login {
  Login copyWith({String? email, String? password}) {
    return Login(
        email: email ?? this.email, password: password ?? this.password);
  }

  Login copyWithWrapped({Wrapped<String>? email, Wrapped<String>? password}) {
    return Login(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class Registration {
  Registration({
    required this.token,
    required this.user,
  });

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false)
  final String token;
  @JsonKey(name: 'user', includeIfNull: false)
  final UserDetail user;
  static const fromJsonFactory = _$RegistrationFromJson;
  static const toJsonFactory = _$RegistrationToJson;
  Map<String, dynamic> toJson() => _$RegistrationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Registration &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $RegistrationExtension on Registration {
  Registration copyWith({String? token, UserDetail? user}) {
    return Registration(token: token ?? this.token, user: user ?? this.user);
  }

  Registration copyWithWrapped(
      {Wrapped<String>? token, Wrapped<UserDetail>? user}) {
    return Registration(
        token: (token != null ? token.value : this.token),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateUser {
  CreateUser({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.jobTitle,
    this.salary,
    required this.departmentId,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) =>
      _$CreateUserFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'password', includeIfNull: false)
  final String password;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
    name: 'role',
    includeIfNull: false,
    toJson: createUserRoleToJson,
    fromJson: createUserRoleFromJson,
  )
  final enums.CreateUserRole role;
  @JsonKey(name: 'jobTitle', includeIfNull: false)
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double? salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  static const fromJsonFactory = _$CreateUserFromJson;
  static const toJsonFactory = _$CreateUserToJson;
  Map<String, dynamic> toJson() => _$CreateUserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateUser &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.jobTitle, jobTitle) ||
                const DeepCollectionEquality()
                    .equals(other.jobTitle, jobTitle)) &&
            (identical(other.salary, salary) ||
                const DeepCollectionEquality().equals(other.salary, salary)) &&
            (identical(other.departmentId, departmentId) ||
                const DeepCollectionEquality()
                    .equals(other.departmentId, departmentId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(jobTitle) ^
      const DeepCollectionEquality().hash(salary) ^
      const DeepCollectionEquality().hash(departmentId) ^
      runtimeType.hashCode;
}

extension $CreateUserExtension on CreateUser {
  CreateUser copyWith(
      {String? email,
      String? password,
      String? name,
      enums.CreateUserRole? role,
      String? jobTitle,
      double? salary,
      double? departmentId}) {
    return CreateUser(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId);
  }

  CreateUser copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? password,
      Wrapped<String>? name,
      Wrapped<enums.CreateUserRole>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double?>? salary,
      Wrapped<double>? departmentId}) {
    return CreateUser(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password),
        name: (name != null ? name.value : this.name),
        role: (role != null ? role.value : this.role),
        jobTitle: (jobTitle != null ? jobTitle.value : this.jobTitle),
        salary: (salary != null ? salary.value : this.salary),
        departmentId:
            (departmentId != null ? departmentId.value : this.departmentId));
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.email,
    required this.name,
    required this.role,
    required this.jobTitle,
    this.salary,
    required this.departmentId,
    required this.id,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false)
  final String email;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
    name: 'role',
    includeIfNull: false,
    toJson: userRoleToJson,
    fromJson: userRoleFromJson,
  )
  final enums.UserRole role;
  @JsonKey(name: 'jobTitle', includeIfNull: false)
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double? salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.jobTitle, jobTitle) ||
                const DeepCollectionEquality()
                    .equals(other.jobTitle, jobTitle)) &&
            (identical(other.salary, salary) ||
                const DeepCollectionEquality().equals(other.salary, salary)) &&
            (identical(other.departmentId, departmentId) ||
                const DeepCollectionEquality()
                    .equals(other.departmentId, departmentId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(jobTitle) ^
      const DeepCollectionEquality().hash(salary) ^
      const DeepCollectionEquality().hash(departmentId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {String? email,
      String? name,
      enums.UserRole? role,
      String? jobTitle,
      double? salary,
      double? departmentId,
      double? id,
      DateTime? createdAt}) {
    return User(
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt);
  }

  User copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<enums.UserRole>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double?>? salary,
      Wrapped<double>? departmentId,
      Wrapped<double>? id,
      Wrapped<DateTime>? createdAt}) {
    return User(
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        role: (role != null ? role.value : this.role),
        jobTitle: (jobTitle != null ? jobTitle.value : this.jobTitle),
        salary: (salary != null ? salary.value : this.salary),
        departmentId:
            (departmentId != null ? departmentId.value : this.departmentId),
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt));
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedUser {
  PaginatedUser({
    required this.total,
    required this.results,
  });

  factory PaginatedUser.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUserFromJson(json);

  @JsonKey(name: 'total', includeIfNull: false)
  final double total;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <User>[])
  final List<User> results;
  static const fromJsonFactory = _$PaginatedUserFromJson;
  static const toJsonFactory = _$PaginatedUserToJson;
  Map<String, dynamic> toJson() => _$PaginatedUserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedUser &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PaginatedUserExtension on PaginatedUser {
  PaginatedUser copyWith({double? total, List<User>? results}) {
    return PaginatedUser(
        total: total ?? this.total, results: results ?? this.results);
  }

  PaginatedUser copyWithWrapped(
      {Wrapped<double>? total, Wrapped<List<User>>? results}) {
    return PaginatedUser(
        total: (total != null ? total.value : this.total),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedTask {
  PaginatedTask({
    required this.total,
    required this.results,
  });

  factory PaginatedTask.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTaskFromJson(json);

  @JsonKey(name: 'total', includeIfNull: false)
  final double total;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Task>[])
  final List<Task> results;
  static const fromJsonFactory = _$PaginatedTaskFromJson;
  static const toJsonFactory = _$PaginatedTaskToJson;
  Map<String, dynamic> toJson() => _$PaginatedTaskToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedTask &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PaginatedTaskExtension on PaginatedTask {
  PaginatedTask copyWith({double? total, List<Task>? results}) {
    return PaginatedTask(
        total: total ?? this.total, results: results ?? this.results);
  }

  PaginatedTask copyWithWrapped(
      {Wrapped<double>? total, Wrapped<List<Task>>? results}) {
    return PaginatedTask(
        total: (total != null ? total.value : this.total),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateTask {
  CreateTask({
    required this.state,
    required this.title,
    required this.description,
    required this.userId,
  });

  factory CreateTask.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskFromJson(json);

  @JsonKey(
    name: 'state',
    includeIfNull: false,
    toJson: createTaskStateToJson,
    fromJson: createTaskStateFromJson,
  )
  final enums.CreateTaskState state;
  @JsonKey(name: 'title', includeIfNull: false)
  final String title;
  @JsonKey(name: 'description', includeIfNull: false)
  final String description;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double userId;
  static const fromJsonFactory = _$CreateTaskFromJson;
  static const toJsonFactory = _$CreateTaskToJson;
  Map<String, dynamic> toJson() => _$CreateTaskToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateTask &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $CreateTaskExtension on CreateTask {
  CreateTask copyWith(
      {enums.CreateTaskState? state,
      String? title,
      String? description,
      double? userId}) {
    return CreateTask(
        state: state ?? this.state,
        title: title ?? this.title,
        description: description ?? this.description,
        userId: userId ?? this.userId);
  }

  CreateTask copyWithWrapped(
      {Wrapped<enums.CreateTaskState>? state,
      Wrapped<String>? title,
      Wrapped<String>? description,
      Wrapped<double>? userId}) {
    return CreateTask(
        state: (state != null ? state.value : this.state),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateDepartment {
  CreateDepartment({
    required this.name,
  });

  factory CreateDepartment.fromJson(Map<String, dynamic> json) =>
      _$CreateDepartmentFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  static const fromJsonFactory = _$CreateDepartmentFromJson;
  static const toJsonFactory = _$CreateDepartmentToJson;
  Map<String, dynamic> toJson() => _$CreateDepartmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateDepartment &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CreateDepartmentExtension on CreateDepartment {
  CreateDepartment copyWith({String? name}) {
    return CreateDepartment(name: name ?? this.name);
  }

  CreateDepartment copyWithWrapped({Wrapped<String>? name}) {
    return CreateDepartment(name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedDepartment {
  PaginatedDepartment({
    required this.total,
    required this.results,
  });

  factory PaginatedDepartment.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDepartmentFromJson(json);

  @JsonKey(name: 'total', includeIfNull: false)
  final double total;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Department>[])
  final List<Department> results;
  static const fromJsonFactory = _$PaginatedDepartmentFromJson;
  static const toJsonFactory = _$PaginatedDepartmentToJson;
  Map<String, dynamic> toJson() => _$PaginatedDepartmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedDepartment &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PaginatedDepartmentExtension on PaginatedDepartment {
  PaginatedDepartment copyWith({double? total, List<Department>? results}) {
    return PaginatedDepartment(
        total: total ?? this.total, results: results ?? this.results);
  }

  PaginatedDepartment copyWithWrapped(
      {Wrapped<double>? total, Wrapped<List<Department>>? results}) {
    return PaginatedDepartment(
        total: (total != null ? total.value : this.total),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateDepartment {
  UpdateDepartment({
    this.name,
  });

  factory UpdateDepartment.fromJson(Map<String, dynamic> json) =>
      _$UpdateDepartmentFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  static const fromJsonFactory = _$UpdateDepartmentFromJson;
  static const toJsonFactory = _$UpdateDepartmentToJson;
  Map<String, dynamic> toJson() => _$UpdateDepartmentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateDepartment &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $UpdateDepartmentExtension on UpdateDepartment {
  UpdateDepartment copyWith({String? name}) {
    return UpdateDepartment(name: name ?? this.name);
  }

  UpdateDepartment copyWithWrapped({Wrapped<String?>? name}) {
    return UpdateDepartment(name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateAttendance {
  CreateAttendance({
    required this.departureTime,
    required this.userId,
  });

  factory CreateAttendance.fromJson(Map<String, dynamic> json) =>
      _$CreateAttendanceFromJson(json);

  @JsonKey(name: 'departureTime', includeIfNull: false)
  final DateTime departureTime;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double userId;
  static const fromJsonFactory = _$CreateAttendanceFromJson;
  static const toJsonFactory = _$CreateAttendanceToJson;
  Map<String, dynamic> toJson() => _$CreateAttendanceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateAttendance &&
            (identical(other.departureTime, departureTime) ||
                const DeepCollectionEquality()
                    .equals(other.departureTime, departureTime)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(departureTime) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $CreateAttendanceExtension on CreateAttendance {
  CreateAttendance copyWith({DateTime? departureTime, double? userId}) {
    return CreateAttendance(
        departureTime: departureTime ?? this.departureTime,
        userId: userId ?? this.userId);
  }

  CreateAttendance copyWithWrapped(
      {Wrapped<DateTime>? departureTime, Wrapped<double>? userId}) {
    return CreateAttendance(
        departureTime:
            (departureTime != null ? departureTime.value : this.departureTime),
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class PaginatedAttendance {
  PaginatedAttendance({
    required this.total,
    required this.results,
  });

  factory PaginatedAttendance.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAttendanceFromJson(json);

  @JsonKey(name: 'total', includeIfNull: false)
  final double total;
  @JsonKey(name: 'results', includeIfNull: false, defaultValue: <Attendance>[])
  final List<Attendance> results;
  static const fromJsonFactory = _$PaginatedAttendanceFromJson;
  static const toJsonFactory = _$PaginatedAttendanceToJson;
  Map<String, dynamic> toJson() => _$PaginatedAttendanceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaginatedAttendance &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(results) ^
      runtimeType.hashCode;
}

extension $PaginatedAttendanceExtension on PaginatedAttendance {
  PaginatedAttendance copyWith({double? total, List<Attendance>? results}) {
    return PaginatedAttendance(
        total: total ?? this.total, results: results ?? this.results);
  }

  PaginatedAttendance copyWithWrapped(
      {Wrapped<double>? total, Wrapped<List<Attendance>>? results}) {
    return PaginatedAttendance(
        total: (total != null ? total.value : this.total),
        results: (results != null ? results.value : this.results));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateAttendance {
  UpdateAttendance({
    this.departureTime,
    this.userId,
  });

  factory UpdateAttendance.fromJson(Map<String, dynamic> json) =>
      _$UpdateAttendanceFromJson(json);

  @JsonKey(name: 'departureTime', includeIfNull: false)
  final DateTime? departureTime;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double? userId;
  static const fromJsonFactory = _$UpdateAttendanceFromJson;
  static const toJsonFactory = _$UpdateAttendanceToJson;
  Map<String, dynamic> toJson() => _$UpdateAttendanceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateAttendance &&
            (identical(other.departureTime, departureTime) ||
                const DeepCollectionEquality()
                    .equals(other.departureTime, departureTime)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(departureTime) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $UpdateAttendanceExtension on UpdateAttendance {
  UpdateAttendance copyWith({DateTime? departureTime, double? userId}) {
    return UpdateAttendance(
        departureTime: departureTime ?? this.departureTime,
        userId: userId ?? this.userId);
  }

  UpdateAttendance copyWithWrapped(
      {Wrapped<DateTime?>? departureTime, Wrapped<double?>? userId}) {
    return UpdateAttendance(
        departureTime:
            (departureTime != null ? departureTime.value : this.departureTime),
        userId: (userId != null ? userId.value : this.userId));
  }
}

String? usersGetRoleToJson(enums.UsersGetRole? usersGetRole) {
  return enums.$UsersGetRoleMap[usersGetRole];
}

enums.UsersGetRole usersGetRoleFromJson(
  Object? usersGetRole, [
  enums.UsersGetRole? defaultValue,
]) {
  if (usersGetRole is String) {
    return enums.$UsersGetRoleMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == usersGetRole.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.UsersGetRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UsersGetRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.UsersGetRole.swaggerGeneratedUnknown;
}

List<String> usersGetRoleListToJson(List<enums.UsersGetRole>? usersGetRole) {
  if (usersGetRole == null) {
    return [];
  }

  return usersGetRole.map((e) => enums.$UsersGetRoleMap[e]!).toList();
}

List<enums.UsersGetRole> usersGetRoleListFromJson(
  List? usersGetRole, [
  List<enums.UsersGetRole>? defaultValue,
]) {
  if (usersGetRole == null) {
    return defaultValue ?? [];
  }

  return usersGetRole.map((e) => usersGetRoleFromJson(e.toString())).toList();
}

List<enums.UsersGetRole>? usersGetRoleNullableListFromJson(
  List? usersGetRole, [
  List<enums.UsersGetRole>? defaultValue,
]) {
  if (usersGetRole == null) {
    return defaultValue;
  }

  return usersGetRole.map((e) => usersGetRoleFromJson(e.toString())).toList();
}

String? tasksIdPatchRoleToJson(enums.TasksIdPatchRole? tasksIdPatchRole) {
  return enums.$TasksIdPatchRoleMap[tasksIdPatchRole];
}

enums.TasksIdPatchRole tasksIdPatchRoleFromJson(
  Object? tasksIdPatchRole, [
  enums.TasksIdPatchRole? defaultValue,
]) {
  if (tasksIdPatchRole is String) {
    return enums.$TasksIdPatchRoleMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == tasksIdPatchRole.toLowerCase(),
            orElse: () => const MapEntry(
                enums.TasksIdPatchRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$TasksIdPatchRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.TasksIdPatchRole.swaggerGeneratedUnknown;
}

List<String> tasksIdPatchRoleListToJson(
    List<enums.TasksIdPatchRole>? tasksIdPatchRole) {
  if (tasksIdPatchRole == null) {
    return [];
  }

  return tasksIdPatchRole.map((e) => enums.$TasksIdPatchRoleMap[e]!).toList();
}

List<enums.TasksIdPatchRole> tasksIdPatchRoleListFromJson(
  List? tasksIdPatchRole, [
  List<enums.TasksIdPatchRole>? defaultValue,
]) {
  if (tasksIdPatchRole == null) {
    return defaultValue ?? [];
  }

  return tasksIdPatchRole
      .map((e) => tasksIdPatchRoleFromJson(e.toString()))
      .toList();
}

List<enums.TasksIdPatchRole>? tasksIdPatchRoleNullableListFromJson(
  List? tasksIdPatchRole, [
  List<enums.TasksIdPatchRole>? defaultValue,
]) {
  if (tasksIdPatchRole == null) {
    return defaultValue;
  }

  return tasksIdPatchRole
      .map((e) => tasksIdPatchRoleFromJson(e.toString()))
      .toList();
}

String? taskStateToJson(enums.TaskState? taskState) {
  return enums.$TaskStateMap[taskState];
}

enums.TaskState taskStateFromJson(
  Object? taskState, [
  enums.TaskState? defaultValue,
]) {
  if (taskState is String) {
    return enums.$TaskStateMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == taskState.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.TaskState.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$TaskStateMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.TaskState.swaggerGeneratedUnknown;
}

List<String> taskStateListToJson(List<enums.TaskState>? taskState) {
  if (taskState == null) {
    return [];
  }

  return taskState.map((e) => enums.$TaskStateMap[e]!).toList();
}

List<enums.TaskState> taskStateListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue ?? [];
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
}

List<enums.TaskState>? taskStateNullableListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue;
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
}

String? userDetailRoleToJson(enums.UserDetailRole? userDetailRole) {
  return enums.$UserDetailRoleMap[userDetailRole];
}

enums.UserDetailRole userDetailRoleFromJson(
  Object? userDetailRole, [
  enums.UserDetailRole? defaultValue,
]) {
  if (userDetailRole is String) {
    return enums.$UserDetailRoleMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userDetailRole.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserDetailRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UserDetailRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.UserDetailRole.swaggerGeneratedUnknown;
}

List<String> userDetailRoleListToJson(
    List<enums.UserDetailRole>? userDetailRole) {
  if (userDetailRole == null) {
    return [];
  }

  return userDetailRole.map((e) => enums.$UserDetailRoleMap[e]!).toList();
}

List<enums.UserDetailRole> userDetailRoleListFromJson(
  List? userDetailRole, [
  List<enums.UserDetailRole>? defaultValue,
]) {
  if (userDetailRole == null) {
    return defaultValue ?? [];
  }

  return userDetailRole
      .map((e) => userDetailRoleFromJson(e.toString()))
      .toList();
}

List<enums.UserDetailRole>? userDetailRoleNullableListFromJson(
  List? userDetailRole, [
  List<enums.UserDetailRole>? defaultValue,
]) {
  if (userDetailRole == null) {
    return defaultValue;
  }

  return userDetailRole
      .map((e) => userDetailRoleFromJson(e.toString()))
      .toList();
}

String? createUserRoleToJson(enums.CreateUserRole? createUserRole) {
  return enums.$CreateUserRoleMap[createUserRole];
}

enums.CreateUserRole createUserRoleFromJson(
  Object? createUserRole, [
  enums.CreateUserRole? defaultValue,
]) {
  if (createUserRole is String) {
    return enums.$CreateUserRoleMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == createUserRole.toLowerCase(),
            orElse: () => const MapEntry(
                enums.CreateUserRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$CreateUserRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.CreateUserRole.swaggerGeneratedUnknown;
}

List<String> createUserRoleListToJson(
    List<enums.CreateUserRole>? createUserRole) {
  if (createUserRole == null) {
    return [];
  }

  return createUserRole.map((e) => enums.$CreateUserRoleMap[e]!).toList();
}

List<enums.CreateUserRole> createUserRoleListFromJson(
  List? createUserRole, [
  List<enums.CreateUserRole>? defaultValue,
]) {
  if (createUserRole == null) {
    return defaultValue ?? [];
  }

  return createUserRole
      .map((e) => createUserRoleFromJson(e.toString()))
      .toList();
}

List<enums.CreateUserRole>? createUserRoleNullableListFromJson(
  List? createUserRole, [
  List<enums.CreateUserRole>? defaultValue,
]) {
  if (createUserRole == null) {
    return defaultValue;
  }

  return createUserRole
      .map((e) => createUserRoleFromJson(e.toString()))
      .toList();
}

String? userRoleToJson(enums.UserRole? userRole) {
  return enums.$UserRoleMap[userRole];
}

enums.UserRole userRoleFromJson(
  Object? userRole, [
  enums.UserRole? defaultValue,
]) {
  if (userRole is String) {
    return enums.$UserRoleMap.entries
        .firstWhere(
            (element) => element.value.toLowerCase() == userRole.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.UserRole.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UserRoleMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ?? defaultValue ?? enums.UserRole.swaggerGeneratedUnknown;
}

List<String> userRoleListToJson(List<enums.UserRole>? userRole) {
  if (userRole == null) {
    return [];
  }

  return userRole.map((e) => enums.$UserRoleMap[e]!).toList();
}

List<enums.UserRole> userRoleListFromJson(
  List? userRole, [
  List<enums.UserRole>? defaultValue,
]) {
  if (userRole == null) {
    return defaultValue ?? [];
  }

  return userRole.map((e) => userRoleFromJson(e.toString())).toList();
}

List<enums.UserRole>? userRoleNullableListFromJson(
  List? userRole, [
  List<enums.UserRole>? defaultValue,
]) {
  if (userRole == null) {
    return defaultValue;
  }

  return userRole.map((e) => userRoleFromJson(e.toString())).toList();
}

String? createTaskStateToJson(enums.CreateTaskState? createTaskState) {
  return enums.$CreateTaskStateMap[createTaskState];
}

enums.CreateTaskState createTaskStateFromJson(
  Object? createTaskState, [
  enums.CreateTaskState? defaultValue,
]) {
  if (createTaskState is String) {
    return enums.$CreateTaskStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == createTaskState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.CreateTaskState.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$CreateTaskStateMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.CreateTaskState.swaggerGeneratedUnknown;
}

List<String> createTaskStateListToJson(
    List<enums.CreateTaskState>? createTaskState) {
  if (createTaskState == null) {
    return [];
  }

  return createTaskState.map((e) => enums.$CreateTaskStateMap[e]!).toList();
}

List<enums.CreateTaskState> createTaskStateListFromJson(
  List? createTaskState, [
  List<enums.CreateTaskState>? defaultValue,
]) {
  if (createTaskState == null) {
    return defaultValue ?? [];
  }

  return createTaskState
      .map((e) => createTaskStateFromJson(e.toString()))
      .toList();
}

List<enums.CreateTaskState>? createTaskStateNullableListFromJson(
  List? createTaskState, [
  List<enums.CreateTaskState>? defaultValue,
]) {
  if (createTaskState == null) {
    return defaultValue;
  }

  return createTaskState
      .map((e) => createTaskStateFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}

// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'openapi.enums.swagger.dart' as enums;
export 'openapi.enums.swagger.dart';

part 'openapi.swagger.chopper.dart';
part 'openapi.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openapi extends ChopperService {
  static Openapi create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$Openapi(client);
    }

    final newClient = ChopperClient(
        services: [_$Openapi()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'http://');
    return _$Openapi(newClient);
  }

  ///
  ///@param id
  Future<chopper.Response> taskIdGet(
      {required String? id, String? cacheControl}) {
    return _taskIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/task/{id}')
  Future<chopper.Response> _taskIdGet(
      {@Path('id') required String? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response> taskIdDelete(
      {required String? id, String? cacheControl}) {
    return _taskIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Delete(path: '/task/{id}')
  Future<chopper.Response> _taskIdDelete(
      {@Path('id') required String? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response> feedGet({String? cacheControl}) {
    return _feedGet(cacheControl: cacheControl);
  }

  ///
  @Get(path: '/feed')
  Future<chopper.Response> _feedGet(
      {@Header('Cache-Control') String? cacheControl});

  ///
  ///@param searchString
  Future<chopper.Response> filteredTasksSearchStringGet(
      {required String? searchString, String? cacheControl}) {
    return _filteredTasksSearchStringGet(
        searchString: searchString, cacheControl: cacheControl);
  }

  ///
  ///@param searchString
  @Get(path: '/filtered-tasks/{searchString}')
  Future<chopper.Response> _filteredTasksSearchStringGet(
      {@Path('searchString') required String? searchString,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response> taskPost({String? cacheControl}) {
    return _taskPost(cacheControl: cacheControl);
  }

  ///
  @Post(path: '/task', optionalBody: true)
  Future<chopper.Response> _taskPost(
      {@Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response> userPost(
      {String? cacheControl, required CreateUserDto? body}) {
    return _userPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/user')
  Future<chopper.Response> _userPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateUserDto? body});

  ///
  ///@param id
  Future<chopper.Response> doneIdPut(
      {required String? id, String? cacheControl}) {
    return _doneIdPut(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Put(path: '/done/{id}', optionalBody: true)
  Future<chopper.Response> _doneIdPut(
      {@Path('id') required String? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<UserDto>> authProfileGet({String? cacheControl}) {
    generatedMapping.putIfAbsent(UserDto, () => UserDto.fromJsonFactory);

    return _authProfileGet(cacheControl: cacheControl);
  }

  ///
  @Get(path: '/auth/profile')
  Future<chopper.Response<UserDto>> _authProfileGet(
      {@Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<RegistrationDto>> authLoginPost(
      {String? cacheControl, required LoginDto? body}) {
    generatedMapping.putIfAbsent(
        RegistrationDto, () => RegistrationDto.fromJsonFactory);

    return _authLoginPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/auth/login')
  Future<chopper.Response<RegistrationDto>> _authLoginPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required LoginDto? body});

  ///
  Future<chopper.Response<UserData>> usersPost(
      {String? cacheControl, required CreateUserDto? body}) {
    generatedMapping.putIfAbsent(UserData, () => UserData.fromJsonFactory);

    return _usersPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/users')
  Future<chopper.Response<UserData>> _usersPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateUserDto? body});

  ///
  ///@param role
  Future<chopper.Response<List<UserData>>> usersGet(
      {required enums.UsersGetRole? role, String? cacheControl}) {
    generatedMapping.putIfAbsent(UserData, () => UserData.fromJsonFactory);

    return _usersGet(
        role: enums.$UsersGetRoleMap[role]?.toString(),
        cacheControl: cacheControl);
  }

  ///
  ///@param role
  @Get(path: '/users')
  Future<chopper.Response<List<UserData>>> _usersGet(
      {@Query('role') required String? role,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<UserData>> usersIdGet(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(UserData, () => UserData.fromJsonFactory);

    return _usersIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/users/{id}')
  Future<chopper.Response<UserData>> _usersIdGet(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});
}

@JsonSerializable(explicitToJson: true)
class CreateUserDto {
  CreateUserDto({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.jobTitle,
    required this.salary,
    required this.departmentId,
  });

  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String password;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  @JsonKey(name: 'role', includeIfNull: false)
  final Object role;
  @JsonKey(name: 'jobTitle', includeIfNull: false, defaultValue: '')
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  static const fromJsonFactory = _$CreateUserDtoFromJson;
  static const toJsonFactory = _$CreateUserDtoToJson;
  Map<String, dynamic> toJson() => _$CreateUserDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateUserDto &&
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

extension $CreateUserDtoExtension on CreateUserDto {
  CreateUserDto copyWith(
      {String? email,
      String? password,
      String? name,
      Object? role,
      String? jobTitle,
      double? salary,
      double? departmentId}) {
    return CreateUserDto(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId);
  }

  CreateUserDto copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? password,
      Wrapped<String>? name,
      Wrapped<Object>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double>? salary,
      Wrapped<double>? departmentId}) {
    return CreateUserDto(
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
class UserDto {
  UserDto({
    required this.email,
    required this.name,
    required this.role,
    required this.jobTitle,
    required this.salary,
    required this.departmentId,
    required this.id,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  @JsonKey(name: 'role', includeIfNull: false)
  final Object role;
  @JsonKey(name: 'jobTitle', includeIfNull: false, defaultValue: '')
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  static const fromJsonFactory = _$UserDtoFromJson;
  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserDto &&
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

extension $UserDtoExtension on UserDto {
  UserDto copyWith(
      {String? email,
      String? name,
      Object? role,
      String? jobTitle,
      double? salary,
      double? departmentId,
      double? id,
      DateTime? createdAt}) {
    return UserDto(
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt);
  }

  UserDto copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<Object>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double>? salary,
      Wrapped<double>? departmentId,
      Wrapped<double>? id,
      Wrapped<DateTime>? createdAt}) {
    return UserDto(
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
class LoginDto {
  LoginDto({
    required this.email,
    required this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String password;
  static const fromJsonFactory = _$LoginDtoFromJson;
  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginDto &&
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

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? email, String? password}) {
    return LoginDto(
        email: email ?? this.email, password: password ?? this.password);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? password}) {
    return LoginDto(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class DepartmentDto {
  DepartmentDto({
    required this.id,
    required this.createdAt,
    required this.name,
  });

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  static const fromJsonFactory = _$DepartmentDtoFromJson;
  static const toJsonFactory = _$DepartmentDtoToJson;
  Map<String, dynamic> toJson() => _$DepartmentDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DepartmentDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $DepartmentDtoExtension on DepartmentDto {
  DepartmentDto copyWith({double? id, DateTime? createdAt, String? name}) {
    return DepartmentDto(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name);
  }

  DepartmentDto copyWithWrapped(
      {Wrapped<double>? id,
      Wrapped<DateTime>? createdAt,
      Wrapped<String>? name}) {
    return DepartmentDto(
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class AttendanceDto {
  AttendanceDto({
    required this.id,
    required this.createdAt,
    required this.userId,
  });

  factory AttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  @JsonKey(name: 'userId', includeIfNull: false)
  final double userId;
  static const fromJsonFactory = _$AttendanceDtoFromJson;
  static const toJsonFactory = _$AttendanceDtoToJson;
  Map<String, dynamic> toJson() => _$AttendanceDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AttendanceDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $AttendanceDtoExtension on AttendanceDto {
  AttendanceDto copyWith({double? id, DateTime? createdAt, double? userId}) {
    return AttendanceDto(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId);
  }

  AttendanceDto copyWithWrapped(
      {Wrapped<double>? id,
      Wrapped<DateTime>? createdAt,
      Wrapped<double>? userId}) {
    return AttendanceDto(
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class UserData {
  UserData({
    required this.id,
    required this.createdAt,
    required this.email,
    required this.name,
    required this.role,
    required this.jobTitle,
    required this.salary,
    required this.departmentId,
    required this.department,
    required this.attendance,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final double id;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime createdAt;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  @JsonKey(name: 'role', includeIfNull: false)
  final Object role;
  @JsonKey(name: 'jobTitle', includeIfNull: false, defaultValue: '')
  final String jobTitle;
  @JsonKey(name: 'salary', includeIfNull: false)
  final double salary;
  @JsonKey(name: 'departmentId', includeIfNull: false)
  final double departmentId;
  @JsonKey(name: 'department', includeIfNull: false)
  final DepartmentDto department;
  @JsonKey(
      name: 'attendance', includeIfNull: false, defaultValue: <AttendanceDto>[])
  final List<AttendanceDto> attendance;
  static const fromJsonFactory = _$UserDataFromJson;
  static const toJsonFactory = _$UserDataToJson;
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
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
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.attendance, attendance) ||
                const DeepCollectionEquality()
                    .equals(other.attendance, attendance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(jobTitle) ^
      const DeepCollectionEquality().hash(salary) ^
      const DeepCollectionEquality().hash(departmentId) ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(attendance) ^
      runtimeType.hashCode;
}

extension $UserDataExtension on UserData {
  UserData copyWith(
      {double? id,
      DateTime? createdAt,
      String? email,
      String? name,
      Object? role,
      String? jobTitle,
      double? salary,
      double? departmentId,
      DepartmentDto? department,
      List<AttendanceDto>? attendance}) {
    return UserData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        jobTitle: jobTitle ?? this.jobTitle,
        salary: salary ?? this.salary,
        departmentId: departmentId ?? this.departmentId,
        department: department ?? this.department,
        attendance: attendance ?? this.attendance);
  }

  UserData copyWithWrapped(
      {Wrapped<double>? id,
      Wrapped<DateTime>? createdAt,
      Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<Object>? role,
      Wrapped<String>? jobTitle,
      Wrapped<double>? salary,
      Wrapped<double>? departmentId,
      Wrapped<DepartmentDto>? department,
      Wrapped<List<AttendanceDto>>? attendance}) {
    return UserData(
        id: (id != null ? id.value : this.id),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        role: (role != null ? role.value : this.role),
        jobTitle: (jobTitle != null ? jobTitle.value : this.jobTitle),
        salary: (salary != null ? salary.value : this.salary),
        departmentId:
            (departmentId != null ? departmentId.value : this.departmentId),
        department: (department != null ? department.value : this.department),
        attendance: (attendance != null ? attendance.value : this.attendance));
  }
}

@JsonSerializable(explicitToJson: true)
class RegistrationDto {
  RegistrationDto({
    required this.token,
    required this.user,
  });

  factory RegistrationDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDtoFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false, defaultValue: '')
  final String token;
  @JsonKey(name: 'user', includeIfNull: false)
  final UserData user;
  static const fromJsonFactory = _$RegistrationDtoFromJson;
  static const toJsonFactory = _$RegistrationDtoToJson;
  Map<String, dynamic> toJson() => _$RegistrationDtoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegistrationDto &&
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

extension $RegistrationDtoExtension on RegistrationDto {
  RegistrationDto copyWith({String? token, UserData? user}) {
    return RegistrationDto(token: token ?? this.token, user: user ?? this.user);
  }

  RegistrationDto copyWithWrapped(
      {Wrapped<String>? token, Wrapped<UserData>? user}) {
    return RegistrationDto(
        token: (token != null ? token.value : this.token),
        user: (user != null ? user.value : this.user));
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

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

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

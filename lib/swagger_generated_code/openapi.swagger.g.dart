// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserDto _$CreateUserDtoFromJson(Map<String, dynamic> json) =>
    CreateUserDto(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String? ?? '',
      salary: (json['salary'] as num).toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateUserDtoToJson(CreateUserDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'role': instance.role,
      'jobTitle': instance.jobTitle,
      'salary': instance.salary,
      'departmentId': instance.departmentId,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String? ?? '',
      salary: (json['salary'] as num).toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'jobTitle': instance.jobTitle,
      'salary': instance.salary,
      'departmentId': instance.departmentId,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

DepartmentDto _$DepartmentDtoFromJson(Map<String, dynamic> json) =>
    DepartmentDto(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DepartmentDtoToJson(DepartmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
    };

AttendanceDto _$AttendanceDtoFromJson(Map<String, dynamic> json) =>
    AttendanceDto(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: (json['userId'] as num).toDouble(),
    );

Map<String, dynamic> _$AttendanceDtoToJson(AttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String? ?? '',
      salary: (json['salary'] as num).toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
      department:
          DepartmentDto.fromJson(json['department'] as Map<String, dynamic>),
      attendance: (json['attendance'] as List<dynamic>?)
              ?.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'jobTitle': instance.jobTitle,
      'salary': instance.salary,
      'departmentId': instance.departmentId,
      'department': instance.department.toJson(),
      'attendance': instance.attendance.map((e) => e.toJson()).toList(),
    };

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDto(
      token: json['token'] as String? ?? '',
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationDtoToJson(RegistrationDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserDto _$CreateUserDtoFromJson(Map<String, dynamic> json) =>
    CreateUserDto(
      email: json['email'] as String,
      password: json['password'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num?)?.toDouble(),
      name: json['name'] as String,
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String?,
    );

Map<String, dynamic> _$CreateUserDtoToJson(CreateUserDto instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salary', instance.salary);
  writeNotNull('departmentId', instance.departmentId);
  val['name'] = instance.name;
  val['role'] = instance.role;
  writeNotNull('jobTitle', instance.jobTitle);
  return val;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      email: json['email'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num?)?.toDouble(),
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) {
  final val = <String, dynamic>{
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salary', instance.salary);
  writeNotNull('departmentId', instance.departmentId);
  val['id'] = instance.id;
  val['createdAt'] = instance.createdAt.toIso8601String();
  val['name'] = instance.name;
  val['role'] = instance.role;
  writeNotNull('jobTitle', instance.jobTitle);
  return val;
}

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      state: json['state'] as Object,
      title: json['title'] as String,
      description: json['description'] as String,
      authorId: (json['authorId'] as num).toDouble(),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'state': instance.state,
      'title': instance.title,
      'description': instance.description,
      'authorId': instance.authorId,
    };

DepartmentDto _$DepartmentDtoFromJson(Map<String, dynamic> json) =>
    DepartmentDto(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
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
      email: json['email'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num?)?.toDouble(),
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      role: json['role'] as Object,
      jobTitle: json['jobTitle'] as String?,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      department:
          DepartmentDto.fromJson(json['department'] as Map<String, dynamic>),
      attendance: (json['attendance'] as List<dynamic>?)
              ?.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) {
  final val = <String, dynamic>{
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salary', instance.salary);
  writeNotNull('departmentId', instance.departmentId);
  val['id'] = instance.id;
  val['createdAt'] = instance.createdAt.toIso8601String();
  val['name'] = instance.name;
  val['role'] = instance.role;
  writeNotNull('jobTitle', instance.jobTitle);
  val['tasks'] = instance.tasks.map((e) => e.toJson()).toList();
  val['department'] = instance.department.toJson();
  val['attendance'] = instance.attendance.map((e) => e.toJson()).toList();
  return val;
}

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDto(
      token: json['token'] as String,
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationDtoToJson(RegistrationDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };

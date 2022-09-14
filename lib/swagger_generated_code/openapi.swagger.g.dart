// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      departureTime: DateTime.parse(json['departureTime'] as String),
      userId: (json['userId'] as num).toDouble(),
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'departureTime': instance.departureTime.toIso8601String(),
      'userId': instance.userId,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      state: taskStateFromJson(json['state']),
      title: json['title'] as String,
      description: json['description'] as String,
      userId: (json['userId'] as num).toDouble(),
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', taskStateToJson(instance.state));
  val['title'] = instance.title;
  val['description'] = instance.description;
  val['userId'] = instance.userId;
  val['id'] = instance.id;
  val['createdAt'] = instance.createdAt.toIso8601String();
  return val;
}

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      email: json['email'] as String,
      name: json['name'] as String,
      role: userDetailRoleFromJson(json['role']),
      jobTitle: json['jobTitle'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
      department: json['department'] as Object,
      attendance: (json['attendance'] as List<dynamic>?)
              ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', userDetailRoleToJson(instance.role));
  val['jobTitle'] = instance.jobTitle;
  writeNotNull('salary', instance.salary);
  val['departmentId'] = instance.departmentId;
  val['department'] = instance.department;
  val['attendance'] = instance.attendance.map((e) => e.toJson()).toList();
  val['tasks'] = instance.tasks.map((e) => e.toJson()).toList();
  val['id'] = instance.id;
  val['createdAt'] = instance.createdAt.toIso8601String();
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

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDto(
      token: json['token'] as String,
      user: UserDetail.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationDtoToJson(RegistrationDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };

CreateUser _$CreateUserFromJson(Map<String, dynamic> json) => CreateUser(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      role: createUserRoleFromJson(json['role']),
      jobTitle: json['jobTitle'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateUserToJson(CreateUser instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', createUserRoleToJson(instance.role));
  val['jobTitle'] = instance.jobTitle;
  writeNotNull('salary', instance.salary);
  val['departmentId'] = instance.departmentId;
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      name: json['name'] as String,
      role: userRoleFromJson(json['role']),
      jobTitle: json['jobTitle'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      departmentId: (json['departmentId'] as num).toDouble(),
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', userRoleToJson(instance.role));
  val['jobTitle'] = instance.jobTitle;
  writeNotNull('salary', instance.salary);
  val['departmentId'] = instance.departmentId;
  val['id'] = instance.id;
  val['createdAt'] = instance.createdAt.toIso8601String();
  return val;
}

PaginatedUser _$PaginatedUserFromJson(Map<String, dynamic> json) =>
    PaginatedUser(
      total: (json['total'] as num).toDouble(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedUserToJson(PaginatedUser instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

PaginatedTask _$PaginatedTaskFromJson(Map<String, dynamic> json) =>
    PaginatedTask(
      total: (json['total'] as num).toDouble(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedTaskToJson(PaginatedTask instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

CreateTask _$CreateTaskFromJson(Map<String, dynamic> json) => CreateTask(
      state: createTaskStateFromJson(json['state']),
      title: json['title'] as String,
      description: json['description'] as String,
      userId: (json['userId'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateTaskToJson(CreateTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', createTaskStateToJson(instance.state));
  val['title'] = instance.title;
  val['description'] = instance.description;
  val['userId'] = instance.userId;
  return val;
}

CreateDepartment _$CreateDepartmentFromJson(Map<String, dynamic> json) =>
    CreateDepartment(
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreateDepartmentToJson(CreateDepartment instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      name: json['name'] as String,
      id: (json['id'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };

PaginatedDepartment _$PaginatedDepartmentFromJson(Map<String, dynamic> json) =>
    PaginatedDepartment(
      total: (json['total'] as num).toDouble(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedDepartmentToJson(
        PaginatedDepartment instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

UpdateDepartment _$UpdateDepartmentFromJson(Map<String, dynamic> json) =>
    UpdateDepartment(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UpdateDepartmentToJson(UpdateDepartment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

CreateAttendance _$CreateAttendanceFromJson(Map<String, dynamic> json) =>
    CreateAttendance(
      departureTime: DateTime.parse(json['departureTime'] as String),
      userId: (json['userId'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateAttendanceToJson(CreateAttendance instance) =>
    <String, dynamic>{
      'departureTime': instance.departureTime.toIso8601String(),
      'userId': instance.userId,
    };

PaginatedAttendance _$PaginatedAttendanceFromJson(Map<String, dynamic> json) =>
    PaginatedAttendance(
      total: (json['total'] as num).toDouble(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaginatedAttendanceToJson(
        PaginatedAttendance instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

UpdateAttendance _$UpdateAttendanceFromJson(Map<String, dynamic> json) =>
    UpdateAttendance(
      departureTime: json['departureTime'] == null
          ? null
          : DateTime.parse(json['departureTime'] as String),
      userId: (json['userId'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UpdateAttendanceToJson(UpdateAttendance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('departureTime', instance.departureTime?.toIso8601String());
  writeNotNull('userId', instance.userId);
  return val;
}

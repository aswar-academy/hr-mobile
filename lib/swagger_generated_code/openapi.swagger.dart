import 'openapi.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'openapi.enums.swagger.dart' as enums;
export 'openapi.enums.swagger.dart';
export 'openapi.models.swagger.dart';

part 'openapi.swagger.chopper.dart';

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
      authenticator: authenticator, /*baseUrl: YOUR_BASE_URL*/
    );
    return _$Openapi(newClient);
  }

  ///
  Future<chopper.Response<UserDetail>> authProfileGet({String? cacheControl}) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _authProfileGet(cacheControl: cacheControl);
  }

  ///
  @Get(path: '/auth/profile')
  Future<chopper.Response<UserDetail>> _authProfileGet(
      {@Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<Registration>> authLoginPost(
      {String? cacheControl, required Login? body}) {
    generatedMapping.putIfAbsent(
        Registration, () => Registration.fromJsonFactory);

    return _authLoginPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/auth/login')
  Future<chopper.Response<Registration>> _authLoginPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required Login? body});

  ///
  Future<chopper.Response<UserDetail>> usersPost(
      {String? cacheControl, required CreateUser? body}) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _usersPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/users')
  Future<chopper.Response<UserDetail>> _usersPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateUser? body});

  ///
  ///@param role
  ///@param skip
  ///@param take
  Future<chopper.Response<PaginatedUser>> usersGet(
      {required enums.UsersGetRole? role,
      num? skip,
      num? take,
      String? cacheControl}) {
    generatedMapping.putIfAbsent(
        PaginatedUser, () => PaginatedUser.fromJsonFactory);

    return _usersGet(
        role: enums.$UsersGetRoleMap[role]?.toString(),
        skip: skip,
        take: take,
        cacheControl: cacheControl);
  }

  ///
  ///@param role
  ///@param skip
  ///@param take
  @Get(path: '/users')
  Future<chopper.Response<PaginatedUser>> _usersGet(
      {@Query('role') required String? role,
      @Query('skip') num? skip,
      @Query('take') num? take,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<UserDetail>> usersIdGet(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _usersIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/users/{id}')
  Future<chopper.Response<UserDetail>> _usersIdGet(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param skip
  ///@param take
  Future<chopper.Response<PaginatedTask>> tasksGet(
      {Object? skip, Object? take, String? cacheControl}) {
    generatedMapping.putIfAbsent(
        PaginatedTask, () => PaginatedTask.fromJsonFactory);

    return _tasksGet(skip: skip, take: take, cacheControl: cacheControl);
  }

  ///
  ///@param skip
  ///@param take
  @Get(path: '/tasks')
  Future<chopper.Response<PaginatedTask>> _tasksGet(
      {@Query('skip') Object? skip,
      @Query('take') Object? take,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<Task>> tasksPost(
      {String? cacheControl, required CreateTask? body}) {
    generatedMapping.putIfAbsent(Task, () => Task.fromJsonFactory);

    return _tasksPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/tasks')
  Future<chopper.Response<Task>> _tasksPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateTask? body});

  ///
  ///@param id
  Future<chopper.Response<Task>> tasksIdGet(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(Task, () => Task.fromJsonFactory);

    return _tasksIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/tasks/{id}')
  Future<chopper.Response<Task>> _tasksIdGet(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  ///@param role
  Future<chopper.Response<Task>> tasksIdPatch(
      {required num? id,
      required enums.TasksIdPatchRole? role,
      String? cacheControl}) {
    generatedMapping.putIfAbsent(Task, () => Task.fromJsonFactory);

    return _tasksIdPatch(
        id: id,
        role: enums.$TasksIdPatchRoleMap[role]?.toString(),
        cacheControl: cacheControl);
  }

  ///
  ///@param id
  ///@param role
  @Patch(path: '/tasks/{id}', optionalBody: true)
  Future<chopper.Response<Task>> _tasksIdPatch(
      {@Path('id') required num? id,
      @Query('role') required String? role,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<Department>> departmentsPost(
      {String? cacheControl, required CreateDepartment? body}) {
    generatedMapping.putIfAbsent(Department, () => Department.fromJsonFactory);

    return _departmentsPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/departments')
  Future<chopper.Response<Department>> _departmentsPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateDepartment? body});

  ///
  ///@param skip
  ///@param take
  Future<chopper.Response<PaginatedDepartment>> departmentsGet(
      {num? skip, num? take, String? cacheControl}) {
    generatedMapping.putIfAbsent(
        PaginatedDepartment, () => PaginatedDepartment.fromJsonFactory);

    return _departmentsGet(skip: skip, take: take, cacheControl: cacheControl);
  }

  ///
  ///@param skip
  ///@param take
  @Get(path: '/departments')
  Future<chopper.Response<PaginatedDepartment>> _departmentsGet(
      {@Query('skip') num? skip,
      @Query('take') num? take,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<Department>> departmentsIdGet(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(Department, () => Department.fromJsonFactory);

    return _departmentsIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/departments/{id}')
  Future<chopper.Response<Department>> _departmentsIdGet(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<Department>> departmentsIdPatch(
      {required num? id,
      String? cacheControl,
      required UpdateDepartment? body}) {
    generatedMapping.putIfAbsent(Department, () => Department.fromJsonFactory);

    return _departmentsIdPatch(id: id, cacheControl: cacheControl, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/departments/{id}')
  Future<chopper.Response<Department>> _departmentsIdPatch(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl,
      @Body() required UpdateDepartment? body});

  ///
  ///@param id
  Future<chopper.Response<Department>> departmentsIdDelete(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(Department, () => Department.fromJsonFactory);

    return _departmentsIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Delete(path: '/departments/{id}')
  Future<chopper.Response<Department>> _departmentsIdDelete(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  Future<chopper.Response<Attendance>> attendancesPost(
      {String? cacheControl, required CreateAttendance? body}) {
    generatedMapping.putIfAbsent(Attendance, () => Attendance.fromJsonFactory);

    return _attendancesPost(cacheControl: cacheControl, body: body);
  }

  ///
  @Post(path: '/attendances')
  Future<chopper.Response<Attendance>> _attendancesPost(
      {@Header('Cache-Control') String? cacheControl,
      @Body() required CreateAttendance? body});

  ///
  ///@param skip
  ///@param take
  Future<chopper.Response<PaginatedAttendance>> attendancesGet(
      {num? skip, num? take, String? cacheControl}) {
    generatedMapping.putIfAbsent(
        PaginatedAttendance, () => PaginatedAttendance.fromJsonFactory);

    return _attendancesGet(skip: skip, take: take, cacheControl: cacheControl);
  }

  ///
  ///@param skip
  ///@param take
  @Get(path: '/attendances')
  Future<chopper.Response<PaginatedAttendance>> _attendancesGet(
      {@Query('skip') num? skip,
      @Query('take') num? take,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<Attendance>> attendancesIdGet(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(Attendance, () => Attendance.fromJsonFactory);

    return _attendancesIdGet(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Get(path: '/attendances/{id}')
  Future<chopper.Response<Attendance>> _attendancesIdGet(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});

  ///
  ///@param id
  Future<chopper.Response<Attendance>> attendancesIdPatch(
      {required num? id,
      String? cacheControl,
      required UpdateAttendance? body}) {
    generatedMapping.putIfAbsent(Attendance, () => Attendance.fromJsonFactory);

    return _attendancesIdPatch(id: id, cacheControl: cacheControl, body: body);
  }

  ///
  ///@param id
  @Patch(path: '/attendances/{id}')
  Future<chopper.Response<Attendance>> _attendancesIdPatch(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl,
      @Body() required UpdateAttendance? body});

  ///
  ///@param id
  Future<chopper.Response<Attendance>> attendancesIdDelete(
      {required num? id, String? cacheControl}) {
    generatedMapping.putIfAbsent(Attendance, () => Attendance.fromJsonFactory);

    return _attendancesIdDelete(id: id, cacheControl: cacheControl);
  }

  ///
  ///@param id
  @Delete(path: '/attendances/{id}')
  Future<chopper.Response<Attendance>> _attendancesIdDelete(
      {@Path('id') required num? id,
      @Header('Cache-Control') String? cacheControl});
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

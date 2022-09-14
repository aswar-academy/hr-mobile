//Generated code

part of 'openapi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Openapi extends Openapi {
  _$Openapi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Openapi;

  @override
  Future<Response<UserDetail>> _authProfileGet({String? cacheControl}) {
    final $url = '/auth/profile';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<Registration>> _authLoginPost(
      {String? cacheControl, required Login? body}) {
    final $url = '/auth/login';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Registration, Registration>($request);
  }

  @override
  Future<Response<UserDetail>> _usersPost(
      {String? cacheControl, required CreateUser? body}) {
    final $url = '/users';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<PaginatedUser>> _usersGet(
      {required String? role, num? skip, num? take, String? cacheControl}) {
    final $url = '/users';
    final $params = <String, dynamic>{'role': role, 'skip': skip, 'take': take};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<PaginatedUser, PaginatedUser>($request);
  }

  @override
  Future<Response<UserDetail>> _usersIdGet(
      {required num? id, String? cacheControl}) {
    final $url = '/users/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<PaginatedTask>> _tasksGet(
      {Object? skip, Object? take, String? cacheControl}) {
    final $url = '/tasks';
    final $params = <String, dynamic>{'skip': skip, 'take': take};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<PaginatedTask, PaginatedTask>($request);
  }

  @override
  Future<Response<Task>> _tasksPost(
      {String? cacheControl, required CreateTask? body}) {
    final $url = '/tasks';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Task, Task>($request);
  }

  @override
  Future<Response<Task>> _tasksIdGet({required num? id, String? cacheControl}) {
    final $url = '/tasks/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Task, Task>($request);
  }

  @override
  Future<Response<Task>> _tasksIdPatch(
      {required num? id, required String? role, String? cacheControl}) {
    final $url = '/tasks/${id}';
    final $params = <String, dynamic>{'role': role};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('PATCH', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<Task, Task>($request);
  }

  @override
  Future<Response<Department>> _departmentsPost(
      {String? cacheControl, required CreateDepartment? body}) {
    final $url = '/departments';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Department, Department>($request);
  }

  @override
  Future<Response<PaginatedDepartment>> _departmentsGet(
      {num? skip, num? take, String? cacheControl}) {
    final $url = '/departments';
    final $params = <String, dynamic>{'skip': skip, 'take': take};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<PaginatedDepartment, PaginatedDepartment>($request);
  }

  @override
  Future<Response<Department>> _departmentsIdGet(
      {required num? id, String? cacheControl}) {
    final $url = '/departments/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Department, Department>($request);
  }

  @override
  Future<Response<Department>> _departmentsIdPatch(
      {required num? id,
      String? cacheControl,
      required UpdateDepartment? body}) {
    final $url = '/departments/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Department, Department>($request);
  }

  @override
  Future<Response<Department>> _departmentsIdDelete(
      {required num? id, String? cacheControl}) {
    final $url = '/departments/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<Department, Department>($request);
  }

  @override
  Future<Response<Attendance>> _attendancesPost(
      {String? cacheControl, required CreateAttendance? body}) {
    final $url = '/attendances';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Attendance, Attendance>($request);
  }

  @override
  Future<Response<PaginatedAttendance>> _attendancesGet(
      {num? skip, num? take, String? cacheControl}) {
    final $url = '/attendances';
    final $params = <String, dynamic>{'skip': skip, 'take': take};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<PaginatedAttendance, PaginatedAttendance>($request);
  }

  @override
  Future<Response<Attendance>> _attendancesIdGet(
      {required num? id, String? cacheControl}) {
    final $url = '/attendances/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Attendance, Attendance>($request);
  }

  @override
  Future<Response<Attendance>> _attendancesIdPatch(
      {required num? id,
      String? cacheControl,
      required UpdateAttendance? body}) {
    final $url = '/attendances/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Attendance, Attendance>($request);
  }

  @override
  Future<Response<Attendance>> _attendancesIdDelete(
      {required num? id, String? cacheControl}) {
    final $url = '/attendances/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<Attendance, Attendance>($request);
  }
}

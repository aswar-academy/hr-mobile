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
  Future<Response<dynamic>> _taskIdGet(
      {required String? id, String? cacheControl}) {
    final $url = '/task/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _taskIdDelete(
      {required String? id, String? cacheControl}) {
    final $url = '/task/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _feedGet({String? cacheControl}) {
    final $url = '/feed';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _filteredTasksSearchStringGet(
      {required String? searchString, String? cacheControl}) {
    final $url = '/filtered-tasks/${searchString}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _taskPost({String? cacheControl}) {
    final $url = '/task';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _userPost(
      {String? cacheControl, required CreateUserDto? body}) {
    final $url = '/user';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _doneIdPut(
      {required String? id, String? cacheControl}) {
    final $url = '/done/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('PUT', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserDto>> _authProfileGet({String? cacheControl}) {
    final $url = '/auth/profile';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserDto, UserDto>($request);
  }

  @override
  Future<Response<RegistrationDto>> _authLoginPost(
      {String? cacheControl, required LoginDto? body}) {
    final $url = '/auth/login';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<RegistrationDto, RegistrationDto>($request);
  }

  @override
  Future<Response<UserData>> _usersPost(
      {String? cacheControl, required CreateUserDto? body}) {
    final $url = '/users';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<UserData, UserData>($request);
  }

  @override
  Future<Response<List<UserData>>> _usersGet(
      {required String? role, String? cacheControl}) {
    final $url = '/users';
    final $params = <String, dynamic>{'role': role};
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<List<UserData>, UserData>($request);
  }

  @override
  Future<Response<UserData>> _usersIdGet(
      {required num? id, String? cacheControl}) {
    final $url = '/users/${id}';
    final $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserData, UserData>($request);
  }
}

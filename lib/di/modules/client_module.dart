import 'dart:async';

import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ClientModule {
  Openapi provideClient() {
    return Openapi.create(
      baseUrl: "https://shrouded-fortress-33438.herokuapp.com",
      // baseUrl: "http://127.0.0.1:3000",
      // authenticator: TokenAuthenticator(),
      interceptors: [
        AuthInterceptor(),
      ],
    );
  }
}

class AuthInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final registration = getIt.get<RegistrationPreference>().getData();

    String? token = registration?.token;

    Map<String, String> headers = {};

    if (token != null) headers.addAll({"Authorization": "Bearer $token"});

    request.headers.addAll(headers);
    print(request.url);
    return request;
  }
}

import 'dart:async';

import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ClientModule {
  Openapi provideClient() {
    return Openapi.create(
      baseUrl: "https://shrouded-fortress-33438.herokuapp.com",
      // baseUrl: "http://127.0.0.1:3000",
      // authenticator: TokenAuthenticator(),
      // interceptors: [
      //   HttpLoggingInterceptor(),
      // ],
    );
  }
}

class AuthInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    request.headers.addAll({});

    return request;
  }
}

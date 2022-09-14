import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocalModule {
  @preResolve
  Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}

@module
abstract class ClientModule {
  Openapi provideClient() {
    return Openapi.create(
      baseUrl: "https://shrouded-fortress-33438.herokuapp.com",
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
  }
}

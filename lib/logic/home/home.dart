import 'package:aswar/main.dart';
import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef HomeState = ResultState<User>;

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState.idle());

  void login() => $client.authProfileGet();
}

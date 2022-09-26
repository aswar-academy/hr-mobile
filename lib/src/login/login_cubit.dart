import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:bloc_error_handler/bloc_error_handler.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends StateCubit<Registration> {
  Future<void> login(Login data) => emitCall($client.authLoginPost(body: data));
}

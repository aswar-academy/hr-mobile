import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';

// swagger_package
// suggestion to use const constructed
const Login fakeLogin = Login(
  email: "masreplay@gmail.com",
  password: "12345678",
);

final fakeTask = CreateTask(
  title: "title",
  description: "description",
  state: CreateTaskState.todo,
  userId: $registrationPreference.getData()!.user.id,
);

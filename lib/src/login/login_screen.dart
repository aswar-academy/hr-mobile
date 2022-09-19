import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/login/login_filter.dart';
import 'package:aswar/ui/logo.dart';
import 'package:aswar/ui/utils.dart';
import 'package:aswar/ui/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: "masreplay@gmail.com");
  final _passwordController = TextEditingController(text: "12345678");

  final _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(child: AswarLogo()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                validator: Validator.of(context).email().build(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: $strings.emailHintText,
                  label: Text($strings.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passwordController,
                validator:
                    Validator.of(context).minLength(8).maxLength(16).build(),
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Text($strings.password),
                ),
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (_, state) => AppButton(
                onPressed: _onLoginPressed,
                title: $strings.login,
                isLoading: state.isLoading,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLoginPressed() async {
    final loginData = Login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    final read = context.read<LoginCubit>();
    await read.login(loginData);

    read.state.whenOrNull(
      data: (registration, _) async {
        final preference = getIt.get<RegistrationPreference>();
        await preference.setData(registration);

        context.showSnackBar($strings.loginSuccessfully);

        context.router.replace(const HomeRoute());
      },
      error: (exception) {
        exception.equalDo(adminRoleNotAllowed, ifEqual: (error) {
          context.showSnackBar($strings.adminAccessError);
        });
      },
    );
  }
}

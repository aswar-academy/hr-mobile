import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/login/login_filter.dart';
import 'package:aswar/ui/logo.dart';
import 'package:aswar/ui/utils.dart';
import 'package:aswar/ui/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: $styles.colors.surface,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: const Center(child: AswarLogo()),
            ),
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
              builder: (context, state) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => onLoginPressed(state),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        $strings.login,
                        style: TextStyle(color: $styles.colors.black),
                      ),
                      if (state.isLoading) const Gap(12),
                      if (state.isLoading)
                        const CircularProgressIndicator(color: Colors.white)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onLoginPressed(LoginState state) async {
    final loginData = Login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    await context.read<LoginCubit>().login(loginData);

    state.whenOrNull(
      data: (registration, response) async {
        final registrationPreference = RegistrationPreference(
          await SharedPreferences.getInstance(),
        );

        await registrationPreference.setData(registration);
        final data = registrationPreference.getData();
        print("pts $data");
      },
      error: (exception) {
        exception.equalDo(adminRoleNotAllowed, ifEqual: (error) {
          context.showSnackBar(
            "Admin can't access the mobile app",
          );
        });
      },
    );
  }
}

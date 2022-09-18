import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/registration.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/login/login_filter.dart';
import 'package:aswar/ui/logo.dart';
import 'package:aswar/ui/utils.dart';
import 'package:aswar/ui/validator.dart';
import 'package:auto_route/auto_route.dart';
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
              builder: (context, state) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: _onLoginPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        $strings.login,
                        style: TextStyle(color: $styles.colors.black),
                      ),
                      if (state.isLoading) const Gap(12),
                      if (state.isLoading)
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
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

        context.showSnackBar("Login successfully");

        context.router.replace(const HomeRoute());
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

class Header extends StatelessWidget {
  final Widget child;

  const Header({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 300),
      child: Container(
        decoration: BoxDecoration(
          color: $styles.colors.surface,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
        ),
        child: child,
      ),
    );
  }
}

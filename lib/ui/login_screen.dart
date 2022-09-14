import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:aswar/ui/logo.dart';
import 'package:error_handler/error_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ResultState<RegistrationDto> _state = const ResultState.idle();
  final _emailController = TextEditingController(text: "masreplay@gmail.com");
  final _passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "example@gmail.com",
                label: Text("email"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("password"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onLoginPressed,
              style: TextButton.styleFrom(
                backgroundColor: $styles.colors.accent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    $strings.login,
                    style: TextStyle(color: $styles.colors.black),
                  ),
                  if (_state.isLoading) const Gap(12),
                  if (_state.isLoading)
                    const CircularProgressIndicator(
                      color: Colors.white,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onLoginPressed() async {
    final loginData = LoginDto(
      email: _emailController.text,
      password: _passwordController.text,
    );
    safeApiCall($client.authLoginPost(body: loginData).transform).listen(
      (event) {
        setState(() {
          _state = event;
        });
        event.whenOrNull(
          data: (data, response) {
            switch (data.user.role) {
              case UserDetailRole.user:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("success")),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(data.user.toString())),
                );
                break;
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("error")),
                );
            }
          },
        );
      },
    );
  }
}
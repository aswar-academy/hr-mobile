import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/login.dart';
import 'package:aswar/ui/logo.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController(text: "masreplay@gmail.com");
  final _passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

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
                  if (state.isLoading) const Gap(12),
                  if (state.isLoading)
                    const CircularProgressIndicator(color: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onLoginPressed() async {
    final loginData = Login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    ref.read(loginProvider.notifier).login(loginData);
  }
}

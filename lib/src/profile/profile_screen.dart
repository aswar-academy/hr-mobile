import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final read = context.read<ProfileCubit>();
    read.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            child: Header(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return AppButton(
                    onPressed: _onLogoutPressed,
                    title: $strings.logout,
                    isLoading: state.logout.isLoading,
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onLogoutPressed() async {
    final read = context.read<ProfileCubit>();
    await read.logout();
    // context.router.push(const LoginRoute());
  }
}

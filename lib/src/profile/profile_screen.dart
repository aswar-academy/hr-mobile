import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/login/login_cubit.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // final read = context.read<ProfileCubit>();
    // read.getProfile();
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
                builder: _buildLogoutButton,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(_, ProfileState state) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: TextButton(
        onPressed: _onLogoutPressed,
        child: Row(
          children: [
            Text(
              $strings.logout,
              style: TextStyle(color: $styles.colors.black),
            ),
            if (state.logout.isLoading) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  void _onLogoutPressed() async {
    final read = context.read<ProfileCubit>();
    await read.logout();
    // context.router.push(const LoginRoute());
  }
}

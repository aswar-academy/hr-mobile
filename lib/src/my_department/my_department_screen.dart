import 'package:aswar/common_libs.dart';
import 'package:aswar/data.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:aswar/ui/logo.dart';
import 'package:aswar/ui/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'my_department_cubit.dart';
import 'my_department_state.dart';

class MyDepartmentScreen extends StatefulWidget {
  const MyDepartmentScreen({super.key});

  @override
  State<MyDepartmentScreen> createState() => _MyDepartmentScreenState();
}

class _MyDepartmentScreenState extends State<MyDepartmentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyDepartmentCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                child: Header(minHeight: 350),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    state.user.maybeWhen(
                      data: (user, response) {
                        return SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all($styles.insets.md),
                            child: Column(
                              children: [
                                Text(
                                  user.email,
                                  style: $styles.text.h4.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(12.0),
                                Text(
                                  user.department.name,
                                  style: $styles.text.h4.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(12.0),
                                Text(
                                  user.jobTitle,
                                  style: $styles.text.h4.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(12.0),
                                const AswarLogo(),
                              ],
                            ),
                          ),
                        );
                      },
                      orElse: SizedBox.new,
                    ),
                    const Spacer(),
                    AppButton(
                      onPressed: _onAddTaskPressed,
                      title: "Github",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onAddTaskPressed() {
    launchUrlString(githubRepository);
  }
}

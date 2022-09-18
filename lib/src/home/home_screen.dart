import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/home/task_list_tile.dart';
import 'package:aswar/src/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final read = context.read<HomeCubit>();
    read.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Header(
                  child: state.maybeWhen(
                    data: (homeData, _) {
                      return SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Gap($styles.insets.sm),
                            Text(
                              $strings.greeting(homeData.user.name),
                              style: $styles.text.h3.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              homeData.user.jobTitle,
                              style: $styles.text.title1.copyWith(
                                color: $styles.colors.accent,
                              ),
                            ),
                            Gap($styles.insets.lg),
                          ],
                        ),
                      );
                    },
                    orElse: SizedBox.new,
                  ),
                ),
              ),
              _buildAddTaskButton(),
              _buildNavigation(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavigation() {
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          TasksListTile(
            icon: Icons.person_rounded,
            iconColor: Colors.teal,
            title: $strings.profile,
            description: $strings.profileSubtitle,
            onPressed: () {
              // context.router.push(ProfileRoute());
            },
          ),
          TasksListTile(
            icon: Icons.person_rounded,
            iconColor: Colors.purple,
            title: $strings.tasks,
            description: $strings.tasksSubtitle(1),
            onPressed: () {
              // context.router.push(TasksRoute());
            },
          ),
          TasksListTile(
            icon: Icons.person_rounded,
            iconColor: Colors.blue,
            title: $strings.department,
            description: $strings.departmentSubtitle,
            onPressed: () {
              // context.router.push(DepartmentRoute());
            },
          ),
          TasksListTile(
            icon: Icons.person_rounded,
            iconColor: Colors.amber,
            title: $strings.payroll,
            description: "time ago package",
            onPressed: () {
              // context.router.push(PayrollRoute());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: TextButton(
        onPressed: () {
          // context.router.push(0Route());
        },
        child: Text(
          $strings.addNewTask,
          style: TextStyle(color: $styles.colors.black),
        ),
      ),
    );
  }
}

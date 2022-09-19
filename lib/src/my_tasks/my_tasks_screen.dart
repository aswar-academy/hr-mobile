import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_tasks_state.dart';
import 'my_tasks_cubit.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyTasksCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MyTasksCubit, MyTasksState>(
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
                    const Spacer(),
                    AppButton(
                      onPressed: _onAddTaskPressed,
                      title: $strings.addNewTask,
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

  void _onAddTaskPressed() {}
}

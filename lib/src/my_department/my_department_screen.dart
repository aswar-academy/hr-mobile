import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<MyDepartmentCubit, MyDepartmentState>(
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

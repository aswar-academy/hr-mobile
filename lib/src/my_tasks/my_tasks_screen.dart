import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/my_tasks/my_task_list_tile.dart';
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
              state.maybeWhen(
                data: (data, response) {
                  return ListView.builder(
                    itemCount: data.results.length,
                    itemBuilder: (context, index) {
                      final task = data.results[index];
                      return TaskListTile(
                        task: task,
                        onPressed: () {
                          // TODO(masreplay): change state
                        },
                      );
                    },
                  );
                },
                orElse: SizedBox.new,
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(title: Text($strings.tasks)),
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

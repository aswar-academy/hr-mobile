import 'package:aswar/common_libs.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/my_tasks/my_task_list_tile.dart';
import 'package:aswar/ui/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_tasks_cubit.dart';
import 'my_tasks_state.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyTasksCubit>().getList();
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
                    AppBar(
                      title: Text(context.localizations.tasks),
                    ),
                    Expanded(
                      child: state.maybeWhen(
                        data: _buildData,
                        orElse: SizedBox.new,
                      ),
                    ),
                    AppButton(
                      onPressed: _onAddTaskPressed,
                      title: context.localizations.addNewTask,
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

  Widget _buildData(PaginatedTask data, _) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.results.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final task = data.results[index];

        return TaskListTile(
          task: task,
          onPressed: context.showUnderDevelopment,
        );
      },
    );
  }
}

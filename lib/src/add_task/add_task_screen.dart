import 'package:aswar/common_libs.dart';
import 'package:aswar/fake.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/ui/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_task_cubit.dart';
import 'add_task_state.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final double _appBarHeight = AppBar().preferredSize.height;

  final _titleController = TextEditingController(
    text: kDebugMode ? fakeTask.title : "",
  );
  final _descriptionController = TextEditingController(
    text: kDebugMode ? fakeTask.description : "",
  );

  @override
  void initState() {
    super.initState();
    context.read<AddTaskCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Header(
              minHeight: _appBarHeight,
              child: AppBar(
                title: Text($strings.addNewTask),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(_appBarHeight * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
                  child: TextFormField(
                    controller: _titleController,
                    validator: Validator.of(context).maxLength(100).build(),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: $strings.titleHint,
                      label: Text($strings.title),
                    ),
                  ),
                ),
                Gap($styles.insets.md),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
                  child: TextFormField(
                    controller: _descriptionController,
                    validator: Validator.of(context).maxLength(100).build(),
                    maxLines: null,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: $strings.descriptionHint,
                      label: Text($strings.description),
                    ),
                  ),
                ),
                // TaskStatePicker(groupValue: _state, onValueChanged: (value) {},)
                const Spacer(),

                BlocBuilder<AddTaskCubit, AddTaskState>(
                  builder: (context, state) {
                    return AppButton(
                      onPressed: _onAddTaskPressed,
                      title: $strings.addNewTask,
                      isLoading: state.isLoading,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onAddTaskPressed() async {
    if (!_formKey.currentState!.validate()) return;

    final body = CreateTask(
      title: _titleController.text,
      description: _descriptionController.text,
      state: CreateTaskState.todo,
      userId: $registrationPreference.getData()!.user.id,
    );

    await context.read<AddTaskCubit>().addTask(body);
  }
}

// class TaskStatePicker extends StatelessWidget {
//   final TaskState groupValue;
//   final ValueChanged<TaskState> onValueChanged;
//   const TaskStatePicker({
//     super.key,
//     required this.groupValue,
//     required this.onValueChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TaskStateRadio(
//           state: TaskState.todo,
//           title: $strings.todoTask,
//           color: Colors.red,
//           onPressed: onValueChanged,
//         ),
//         TaskStateRadio(
//           state: TaskState.doing,
//           title: $strings.doingTask,
//           color: Colors.yellow,
//           onPressed: onValueChanged,
//         ),
//         TaskStateRadio(
//           state: TaskState.done,
//           title: $strings.doneTask,
//           color: Colors.green,
//           onPressed: onValueChanged,
//         ),
//       ],
//     );
//   }
// }

// class TaskStateRadio extends StatelessWidget {
//   final String title;
//   final TaskState state;
//   final Color color;
//   final ValueChanged<TaskState> onPressed;

//   const TaskStateRadio({
//     super.key,
//     required this.title,
//     required this.color,
//     required this.onPressed,
//     required this.state,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onPressed(state),
//       child: Ink(
//         color: color,
//         child: Text(title),
//       ),
//     );
//   }
// }

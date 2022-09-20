import 'package:aswar/common_libs.dart';
import 'package:intl/intl.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    required this.task,
    required this.onPressed,
  }) : super(key: key);

  final Task task;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular($styles.corners.md);
    return Card(
      elevation: 25,
      margin: EdgeInsets.symmetric(
        horizontal: $styles.insets.sm,
        vertical: $styles.insets.xs,
      ),
      shape: RoundedRectangleBorder(borderRadius: border),
      child: InkWell(
        onTap: onPressed,
        borderRadius: border,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: $styles.text.h5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: task.state.color,
                      borderRadius: BorderRadius.circular($styles.corners.md),
                    ),
                    padding: EdgeInsets.all($styles.insets.xxs),
                    child: Text(
                      task.state.local(context.localizations),
                      style: $styles.text.title1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Gap($styles.insets.xxs),
              Text(task.description, style: $styles.text.title2),
              const Divider(color: Colors.grey),
              Text(
                task.createdAt.format(),
                style: $styles.text.title2.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on DateTime {
  String format() {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    return inputFormat.format(this);
  }
}

extension on TaskState {
  Color get color {
    final data = {
      TaskState.doing: const Color(0xffFF7676),
      TaskState.todo: $styles.colors.accent,
      TaskState.done: const Color(0xff82D2A7),
    };
    return data[this]!;
  }

// replace [context] with localization
  String local(AppLocalizations localizations) {
    final data = {
      TaskState.doing: localizations.doingTask,
      TaskState.todo: localizations.todoTask,
      TaskState.done: localizations.doneTask,
    };
    return data[this]!;
  }
}

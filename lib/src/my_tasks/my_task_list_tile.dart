import 'package:aswar/common_libs.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: border),
        child: InkWell(
          onTap: onPressed,
          borderRadius: border,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap($styles.insets.md),
                    Text(
                      task.title,
                      style: $styles.text.h5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap($styles.insets.xxs),
                Text(task.description, style: $styles.text.title2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

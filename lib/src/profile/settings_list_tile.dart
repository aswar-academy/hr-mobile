import 'package:aswar/common_libs.dart';
import 'package:aswar/src/home/task_list_tile.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.title,
    required this.iconColor,
    required this.onPressed,
    required this.icon,
     this.description = "",
  }) : super(key: key);

  final String title;
  final String description;
  final MaterialColor iconColor;
  final IconData icon;
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
          focusColor: iconColor.shade100,
          hoverColor: iconColor.shade100,
          splashColor: iconColor.shade400,
          highlightColor: iconColor.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BorderedIcon(color: iconColor, icon: icon),
                    Gap($styles.insets.md),
                    Text(
                      title,
                      style: $styles.text.h5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap($styles.insets.xxs),
                Text(description, style: $styles.text.title2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

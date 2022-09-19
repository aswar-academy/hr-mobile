import 'package:aswar/common_libs.dart';

const double _iconSize = 40.0;

class NavigationListTile extends StatelessWidget {
  const NavigationListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String description;
  final MaterialColor iconColor;
  final IconData icon;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular($styles.corners.lg);
    return Card(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BorderedIcon(color: iconColor, icon: icon),
              Gap($styles.insets.md),
              Text(
                title,
                style: $styles.text.h5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap($styles.insets.xxs),
              Text(description, style: $styles.text.title2),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderedIcon extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;

  const BorderedIcon({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _iconSize,
      width: _iconSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular($styles.corners.md),
      ),
      child: Icon(icon, color: color),
    );
  }
}

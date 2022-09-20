import 'package:aswar/common_libs.dart';

class Header extends StatelessWidget {
  final Widget child;
  final double minHeight;

  const Header({
    super.key,
    this.child = const SizedBox.shrink(),
    this.minHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Container(
        decoration: BoxDecoration(
          color: $styles.colors.surface,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(minHeight / 2.5),
          ),
        ),
        child: child,
      ),
    );
  }
}

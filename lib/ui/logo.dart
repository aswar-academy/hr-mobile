import 'package:aswar/common_libs.dart';
import 'package:google_fonts/google_fonts.dart';

class AswarLogo extends StatelessWidget {
  final bool showIcon;
  final TextStyle? firstColorStyle;

  const AswarLogo({
    super.key,
    this.showIcon = true,
    this.firstColorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.raleway(fontSize: 40);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showIcon) const Icon(Icons.people_rounded, color: Colors.white),
        if (showIcon) Gap($styles.insets.xs),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.localizations.appName[0],
                style: firstColorStyle ??
                    GoogleFonts.raleway(
                      fontSize: 40,
                      color: $styles.colors.accent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: context.localizations.appName.substring(1),
                style: textStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}

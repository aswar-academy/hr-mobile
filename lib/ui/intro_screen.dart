import 'package:aswar/common_libs.dart';
import 'package:aswar/gen/assets.gen.dart';
import 'package:aswar/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_intro_screen/image.dart';
import 'package:flutter_intro_screen/screen.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static TextStyle titleStyle = GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle descriptionStyle = GoogleFonts.raleway(
    fontSize: 18,
  );

  static List<IntroPageData> pageData = [
    IntroPageData(
      title: Text(
        $strings.intro1,
        style: titleStyle,
        textAlign: TextAlign.center,
      ),
      description: Text(
        $strings.introDescription1,
        style: descriptionStyle,
        textAlign: TextAlign.center,
      ),
      image: IntroAssetsImage(path: Assets.images.intro1.path),
    ),
    IntroPageData(
      title: Text(
        $strings.intro2,
        style: titleStyle,
        textAlign: TextAlign.center,
      ),
      description: Text(
        $strings.introDescription2,
        style: descriptionStyle,
        textAlign: TextAlign.center,
      ),
      image: IntroAssetsImage(path: Assets.images.intro2.path),
    ),
    IntroPageData(
      title: Text(
        $strings.intro3,
        style: titleStyle,
        textAlign: TextAlign.center,
      ),
      description: Text(
        $strings.introDescription3,
        style: descriptionStyle,
        textAlign: TextAlign.center,
      ),
      image: IntroAssetsImage(path: Assets.images.intro3.path),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterIntroScreen(
        appLogo: AswarLogo(
          firstColorStyle: GoogleFonts.raleway(
            fontSize: 40,
            color: $styles.colors.accent,
            fontWeight: FontWeight.bold,
          ),
        ),
        pageData: pageData,
        colors: IntroColors(
          background: $styles.colors.surface,
          button: $styles.colors.accent,
        ),
        centerWidget: Text(
          $strings.swap,
          style: GoogleFonts.raleway(
            fontSize: 14,
          ),
        ),
        onCompletePressed: () {
          AutoRouter.of(context).replace(const HomeRoute());
        },
      ),
    );
  }
}

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
        StaticTextScale(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: $strings.appName[0],
                  style: firstColorStyle ?? textStyle,
                ),
                TextSpan(
                  text: $strings.appName.substring(1),
                  style: textStyle,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

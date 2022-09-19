import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/intro_screen_preference.dart';
import 'package:aswar/gen/assets.gen.dart';
import 'package:aswar/main.dart';
import 'package:aswar/ui/logo.dart';
import 'package:flutter_intro_screen/flutter_intro_screen.dart';
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
        appLogo: const AswarLogo(),
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
        onCompletePressed: () async {
          await getIt<IntroScreenPreference>().setData(false);

          // https://github.com/dart-lang/linter/issues/3700
          context.router.replace(const LoginRoute());
        },
      ),
    );
  }
}

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
      image: IntroAssetsImage(path: Assets.images.intro.path),
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
      image: IntroAssetsImage(path: Assets.icons.logo.path),
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
      image: IntroAssetsImage(path: Assets.icons.logo.path),
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
          style: descriptionStyle,
        ),
        onCompletePressed: () {
          AutoRouter.of(context).replace(const HomeRoute());
        },
      ),
    );
  }
}

class AswarLogo extends StatelessWidget {
  const AswarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.people_rounded,
          color: Colors.white,
        ),
        Gap($styles.insets.xs),
        StaticTextScale(
          child: Text(
            $strings.appName,
            style: GoogleFonts.raleway(fontSize: 40),
          ),
        )
      ],
    );
  }
}

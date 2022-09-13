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
  static TextStyle titleStyle = GoogleFonts.vazirmatn(
    fontSize: 22,
  );
  static TextStyle descriptionStyle = GoogleFonts.vazirmatn();

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
      image: IntroAssetsImage(path: Assets.icons.logo.path),
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
        appLogo: AswarLogo(),
        pageData: pageData,
        centerWidget: Text($strings.swap),
        onCompletePressed: () {
          AutoRouter.of(context).replace(const HomeRoute());
        },
      ),
    );
  }
}

class AswarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ExcludeSemantics(
        //   child: SvgPicture.asset(SvgPaths.compassSimple,
        //       color: $styles.colors.offWhite, height: 48),
        // ),
        Gap($styles.insets.xs),
        StaticTextScale(
          child: Text(
            "Aswar",
            style: $styles.text.wonderTitle.copyWith(
              fontSize: 32,
              color: $styles.colors.offWhite,
            ),
          ),
        )
      ],
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:aswar/common_libs.dart';
import 'package:google_fonts/google_fonts.dart';

export 'colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  AppStyle();

  /// The current theme colors for the app
  final colors = const AppColors();

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();

  late final _Shadows shadows = _Shadows();

  /// Padding and margin values
  late final _Insets insets = _Insets();

  /// Text styles
  late final _Text text = _Text();

  /// Animation Durations
  final _Times times = _Times();
}

@immutable
class _Text {
  final Map<String, TextStyle> _titleFonts = {
    'en': const TextStyle(fontFamily: 'Tenor'),
  };

  final Map<String, TextStyle> _monoTitleFonts = {
    'en': const TextStyle(fontFamily: 'B612Mono'),
  };

  final Map<String, TextStyle> _quoteFonts = {
    'en': const TextStyle(fontFamily: 'Cinzel'),
  };

  final Map<String, TextStyle> _wonderTitleFonts = {
    'en': const TextStyle(fontFamily: 'Yeseva'),
  };

  final Map<String, TextStyle> _contentFonts = {
    'en': const TextStyle(),
  };

  TextStyle _getFontForLocale(Map<String, TextStyle> fonts) {
    return GoogleFonts.vazirmatn();
  }

  TextStyle get titleFont => _getFontForLocale(_titleFonts);
  TextStyle get quoteFont => _getFontForLocale(_quoteFonts);
  TextStyle get wonderTitleFont => _getFontForLocale(_wonderTitleFonts);
  TextStyle get contentFont => _getFontForLocale(_contentFonts);
  TextStyle get monoTitleFont => _getFontForLocale(_monoTitleFonts);

  late final TextStyle dropCase = copy(
    quoteFont,
    sizePx: 56,
    heightPx: 20,
  );
  late final TextStyle wonderTitle = copy(
    wonderTitleFont,
    sizePx: 64,
    heightPx: 56,
  );
  late final TextStyle h1 = copy(
    titleFont,
    sizePx: 64,
    heightPx: 62,
  );
  late final TextStyle h2 = copy(
    titleFont,
    sizePx: 32,
    heightPx: 46,
  );
  late final TextStyle h3 = copy(
    titleFont,
    sizePx: 24,
    heightPx: 36,
    weight: FontWeight.w600,
  );
  late final TextStyle h4 = copy(
    contentFont,
    sizePx: 22,
    heightPx: 23,
    spacingPc: 5,
    weight: FontWeight.w600,
  );
  late final TextStyle h5 = copy(
    contentFont,
    sizePx: 18,
    heightPx: 23,
    spacingPc: 5,
    weight: FontWeight.w600,
  );
  late final TextStyle h6 = copy(
    contentFont,
    sizePx: 14,
    heightPx: 23,
    spacingPc: 5,
    weight: FontWeight.w600,
  );
  late final TextStyle title1 = copy(
    titleFont,
    sizePx: 16,
    heightPx: 26,
    spacingPc: 5,
  );
  late final TextStyle title2 = copy(
    titleFont,
    sizePx: 14,
    heightPx: 16.38,
  );

  late final TextStyle body = copy(
    contentFont,
    sizePx: 16,
    heightPx: 27,
  );
  late final TextStyle bodyBold = copy(
    contentFont,
    sizePx: 16,
    heightPx: 26,
    weight: FontWeight.w600,
  );
  late final TextStyle bodySmall = copy(
    contentFont,
    sizePx: 14,
    heightPx: 23,
  );
  late final TextStyle bodySmallBold = copy(
    contentFont,
    sizePx: 14,
    heightPx: 23,
    weight: FontWeight.w600,
  );

  late final TextStyle quote1 = copy(
    quoteFont,
    sizePx: 36,
    heightPx: 40,
    weight: FontWeight.w600,
    spacingPc: -3,
  );
  late final TextStyle quote2 = copy(
    quoteFont,
    sizePx: 21,
    heightPx: 32,
    weight: FontWeight.w400,
  );
  late final TextStyle quote2Sub = copy(
    body,
    sizePx: 16,
    heightPx: 40,
    weight: FontWeight.w400,
  );

  late final TextStyle caption = copy(
    contentFont,
    sizePx: 12,
    heightPx: 18,
    weight: FontWeight.w500,
  ).copyWith(fontStyle: FontStyle.italic);

  late final TextStyle callout = copy(
    contentFont,
    sizePx: 16,
    heightPx: 26,
    weight: FontWeight.w600,
  ).copyWith(fontStyle: FontStyle.italic);

  late final TextStyle button = copy(
    titleFont,
    sizePx: 16,
    weight: FontWeight.w600,
    heightPx: 13.2,
  );

  TextStyle copy(
    TextStyle style, {
    required double sizePx,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    return style.copyWith(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : style.height,
      letterSpacing:
          spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
    );
  }
}

@immutable
class _Times {
  final Duration fast = const Duration(
    milliseconds: 300,
  );
  final Duration med = const Duration(
    milliseconds: 600,
  );
  final Duration slow = const Duration(
    milliseconds: 900,
  );
  final Duration pageTransition = const Duration(
    milliseconds: 200,
  );
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Shadows {
  final text = [
    Shadow(
      color: Colors.black.withOpacity(.6),
      offset: const Offset(0, 2),
      blurRadius: 2,
    ),
  ];
  final textStrong = [
    Shadow(
      color: Colors.black.withOpacity(.6),
      offset: const Offset(0, 4),
      blurRadius: 6,
    ),
  ];
}

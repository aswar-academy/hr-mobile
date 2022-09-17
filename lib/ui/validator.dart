import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef Action<T> = Function(T builder);

class Validator {
  static const int maxSelectedImages = 10;
  static const int nameMaxLength = 65;
  static const int descriptionMaxLength = 1000;
  static const int passwordMinLength = 8;
  static const int passwordMaxLength = 64;
  static const int unitMaxLength = 3;
  static const int areaLength = 9;

  static Validator of(BuildContext context) {
    return Validator(AppLocalizations.of(context));
  }

  Validator(
    AppLocalizations translation, {
    this.isOptional = false,
    this.requiredMessage,
  }) : _translation = translation {
    // Unless a builder is isOptional, the first thing we do is to add a
    // [required] validator. All subsequent validators should expect
    // a non-null argument.
    if (!isOptional) required(requiredMessage);
  }

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$",
  );
  static final RegExp _nonDigitsExp = RegExp(r'[^\d]');
  static final RegExp _englishLetter = RegExp(r'[A-Za-z]');
  static final RegExp _phoneRegExp = RegExp(r'^\d{7,15}$');
  static final RegExp _rcUsername = RegExp(r'^[a-z0-9]{3,20}_[a-z]{2}$');
  static final RegExp usernameRegex = RegExp(r'/[A-Za-z][A-Za-z0-9]*$');
  static final RegExp _youtubeRegExp = RegExp(
    r'^(http(s)??\:\/\/)?(www\.)?((youtube\.com\/watch\?v=)|(youtu.be\/))([a-zA-Z0-9\-_])+',
  );
  static final RegExp _urlRegExp = RegExp(
    r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})',
  );

  /// language regex
  // ignore: unused_field
  static final RegExp _arabicExp = RegExp(r'^[\u0621-\u064A0-9 ]+$');
  // ignore: unused_field
  static final RegExp _englishExp = RegExp(r'^[a-zA-Z]$');

  final bool isOptional;
  final String? requiredMessage;
  final AppLocalizations _translation;
  final List<FormFieldValidator<String>> validations = [];

  /// Clears validation list and adds required validation if
  /// [isOptional] is false
  Validator reset() {
    validations.clear();
    if (!isOptional) {
      required(requiredMessage);
    }
    return this;
  }

  /// Adds new item to [validations] list, returns this instance
  Validator add(FormFieldValidator<String> validator) {
    validations.add(validator);
    return this;
  }

  /// Tests [value] against defined [validations]
  String? test(String? value) {
    for (var validate in validations) {
      // Return null if field is isOptional and value is null
      if (isOptional && (value == null || value.isEmpty)) {
        return null;
      }

      // Otherwise execute validations
      final result = validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  /// Returns a validator function for FormInput
  FormFieldValidator<String> build() => test;

  /// Throws error only if [left] and [right] validators throw error same time.
  /// If [reverse] is true left builder's error will be displayed otherwise
  /// right builder's error. Because this is default behavior on most of the
  /// programming languages.
  Validator or(
    Action<Validator> left,
    Action<Validator> right, {
    bool reverse = false,
  }) {
    // Create
    final v1 = Validator(_translation);
    final v2 = Validator(_translation);

    // Configure
    left(v1);
    right(v2);

    // Build
    final v1cb = v1.build();
    final v2cb = v2.build();

    // Test
    return add((value) {
      final leftResult = v1cb(value);
      if (leftResult == null) {
        return null;
      }
      final rightResult = v2cb(value);
      if (rightResult == null) {
        return null;
      }
      return reverse == true ? leftResult : rightResult;
    });
  }

  /// Value must not be null
  Validator required([String? message]) => add(
        (v) => v == null || v.isEmpty
            ? message ?? _translation.validationRequired
            : null,
      );

  Validator equal(dynamic value, String valueName, [String? message]) => add(
        (v) => v != value
            ? message ?? _translation.validationEqualValueName
            : null,
      );

  Validator passwordEqual(dynamic value, String valueName, [String? message]) =>
      add(
        (v) =>
            v != value ? message ?? _translation.validationPasswordNull : null,
      );

  Validator notEqual(dynamic value, [String? message]) =>
      add((v) => v == value ? message : null);

  /// Value length must be greater than or equal to [minLength]
  Validator minLength(int minLength, [String? message]) => add(
        (v) => v!.length < minLength
            ? message ?? _translation.validationMinMinLength
            : null,
      );

  /// Value length must be less than or equal to [maxLength]
  Validator maxLength(int maxLength, [String? message]) => add(
        (v) => v!.length > maxLength
            ? message ?? _translation.validationMaxMaxLength
            : null,
      );

  /// Value must be less than or equal to [max]
  Validator max(int? max, [String? message]) => add(
        (v) {
          if (max == null) return null;
          if (v != null && int.tryParse(v) != null) {
            return int.tryParse(v)! > max
                ? message ?? _translation.validationLessThanMax
                : null;
          }
          return null;
        },
      );

  /// Value must match [regExp]
  Validator regExp(RegExp regExp, String message) =>
      add((v) => regExp.hasMatch(v!) ? null : message);

  /// Value must be a well formatted email
  Validator email([String? message]) => add(
        (v) => isEmail(v!) ? null : message ?? _translation.validationEmail,
      );

  /// Value must be a well formatted phone number
  Validator phone([String? message]) => add(
        (v) =>
            isPhone(v!) ? null : message ?? _translation.validationPhoneNumber,
      );

  /// Value must be a well formatted URL address
  Validator url([String? message]) => add(
        (v) => _urlRegExp.hasMatch(v!)
            ? null
            : message ?? _translation.validationUrl,
      );

  /// Value must be a well formatted Youtube url address
  Validator youtubeUrl([String? message]) => add(
        (v) => _youtubeRegExp.hasMatch(v!)
            ? null
            : message ?? _translation.validationYoutubeUrl,
      );

  static bool isEmail(String v) => _emailRegExp.hasMatch(v);

  static bool isPhone(String v) =>
      !_englishLetter.hasMatch(v) &&
      _phoneRegExp.hasMatch(v.replaceAll(_nonDigitsExp, ''));
}

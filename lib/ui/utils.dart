import 'package:aswar/common_libs.dart';
import 'package:aswar/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

extension ScaffoldMessengerExtension on BuildContext {
  void showUnderDevelopment() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: $styles.colors.surface,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.github,
                color: Colors.white,
              ),
              onPressed: () {
                launchUrlString(githubRepository);
              },
            ),
            // error getter not showing auto complete in extension function
            Text(localizations.featureUnderDevelopment),
          ],
        ),
      ),
    );
  }

  void showSnackBar(message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: $styles.colors.surface,
        content: Text(message),
      ),
    );
  }
}

extension DeviceUtilsExtension on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  void removeFocus() {
    hideKeyboard();
    FocusNode().requestFocus();
  }
}

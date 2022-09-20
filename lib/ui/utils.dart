import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';

extension ScaffoldMessengerExtension on BuildContext {
  void showUnderDevelopment() {
    showSnackBar($strings.featureUnderDevelopment);
  }

  void showSnackBar(message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
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

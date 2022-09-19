import 'package:aswar/common_libs.dart';



extension ScaffoldMessengerExtension on BuildContext {
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

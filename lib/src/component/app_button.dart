import 'package:aswar/common_libs.dart';

const double _buttonSize = 16.0;

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: $styles.colors.black),
            ),
            if (isLoading) const Gap(12),
            if (isLoading)
              const SizedBox(
                width: _buttonSize,
                height: _buttonSize,
                child: CircularProgressIndicator(color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}

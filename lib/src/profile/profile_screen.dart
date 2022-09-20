import 'package:aswar/common_libs.dart';
import 'package:aswar/gen/assets.gen.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/home/task_list_tile.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _imageSize = 100.0;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final read = context.read<ProfileCubit>();
    read.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular($styles.corners.md),
    );
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            child: Header(
              minHeight: 250,
            ),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppBar(
                    title: Text(
                      $strings.profile,
                      style: $styles.text.h5.copyWith(),
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Card(
                            margin: const EdgeInsets.all(8.0).copyWith(
                              top: _imageSize / 2,
                            ),
                            elevation: 25,
                            shape: shape,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0).copyWith(
                                top: _imageSize / 2 + 16,
                              ),
                              child: state.user.maybeWhen(
                                data: (user, response) => Column(
                                  children: [
                                    Text(user.name, style: $styles.text.h3),
                                    const Gap(12.0),
                                    Text(user.email,
                                        style: $styles.text.title1),
                                    const Gap(12.0),
                                    Text(
                                      user.jobTitle,
                                      style: $styles.text.title1.copyWith(
                                        color: const Color(0xFF5E80D1),
                                      ),
                                    ),
                                  ],
                                ),
                                orElse: SizedBox.shrink,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF0AD),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Assets.images.avatarMale.image(
                              height: _imageSize,
                              width: _imageSize,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Settings", style: $styles.text.h4),
                  ),
                  SettingsOption(
                    title: "اللغة",
                    description: "العربية",
                    icon: Icons.language,
                    iconColor: Colors.purple,
                    onPressed: () {},
                  ),
                  SettingsOption(
                    title: "المظهر",
                    description: "داكن",
                    icon: Icons.language,
                    iconColor: Colors.purple,
                    onPressed: () {},
                  ),
                  SettingsOption(
                    title: "سياسة الخصوصية",
                    description: "",
                    icon: Icons.language,
                    iconColor: Colors.purple,
                    onPressed: () {},
                  ),
                  SettingsOption(
                    title: "الشروط والاحكام",
                    description: "",
                    icon: Icons.book,
                    iconColor: Colors.purple,
                    onPressed: () {},
                  ),
                  const Spacer(),
                  AppButton(
                    onPressed: _onLogoutPressed,
                    title: $strings.logout,
                    isLoading: state.logout.isLoading,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _onLogoutPressed() async {
    final read = context.read<ProfileCubit>();
    await read.logout();
    context.router.push(const LoginRoute());
  }
}

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    Key? key,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String description;
  final MaterialColor iconColor;
  final IconData icon;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular($styles.corners.md);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: border),
        child: InkWell(
          onTap: onPressed,
          borderRadius: border,
          focusColor: iconColor.shade100,
          hoverColor: iconColor.shade100,
          splashColor: iconColor.shade400,
          highlightColor: iconColor.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BorderedIcon(color: iconColor, icon: icon),
                    Gap($styles.insets.md),
                    Text(
                      title,
                      style: $styles.text.h5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap($styles.insets.xxs),
                Text(description, style: $styles.text.title2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

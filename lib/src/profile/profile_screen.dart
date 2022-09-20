import 'package:aswar/common_libs.dart';
import 'package:aswar/gen/assets.gen.dart';
import 'package:aswar/language.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:aswar/src/profile/settings_list_tile.dart';
import 'package:aswar/ui/utils.dart';
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
                      context.localizations.profile,
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
                                ).animate().scale(),
                                orElse: SizedBox.new,
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      context.localizations.settings,
                      style: $styles.text.h4,
                    ),
                  ),
                  SettingsListTile(
                    title: context.localizations.language,
                    description: context.localizations.arabic,
                    icon: Icons.language,
                    iconColor: Colors.purple,
                    onPressed: () {
                      context.read<LanguageCubit>().changeLanguage();
                    },
                  ),
                  SettingsListTile(
                    title: context.localizations.appearance,
                    description: context.localizations.dark,
                    icon: Icons.dark_mode,
                    iconColor: Colors.purple,
                    onPressed: context.showUnderDevelopment,
                  ),
                  SettingsListTile(
                    title: context.localizations.termAndConditions,
                    icon: Icons.book,
                    iconColor: Colors.purple,
                    onPressed: context.showUnderDevelopment,
                  ),
                  SettingsListTile(
                    title: context.localizations.privacyPolicy,
                    icon: Icons.book,
                    iconColor: Colors.purple,
                    onPressed: context.showUnderDevelopment,
                  ),
                  const Spacer(),
                  AppButton(
                    onPressed: _onLogoutPressed,
                    title: context.localizations.logout,
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

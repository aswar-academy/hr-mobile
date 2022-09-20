import 'package:aswar/common_libs.dart';
import 'package:aswar/language.dart';
import 'package:aswar/src/home/home.dart';
import 'package:aswar/src/login/login_cubit.dart';
import 'package:aswar/src/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/add_task/add_task.dart';
import '../src/my_department/my_department.dart';
import '../src/my_tasks/my_tasks.dart';
import '../src/payroll/payroll.dart';

class AswarApp extends StatefulWidget {
  const AswarApp({super.key});

  @override
  State<AswarApp> createState() => _AswarAppState();
}

class _AswarAppState extends State<AswarApp> {
  final _appRouter = AppRouter(
    introScreenGuard: IntroScreenGuard(),
    authenticatedGuard: AuthenticatedGuard(),
    notAuthenticatedGuard: NotAuthenticatedGuard(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AddTaskCubit>(create: (_) => getIt<AddTaskCubit>()),
        BlocProvider<MyDepartmentCubit>(
            create: (_) => getIt<MyDepartmentCubit>()),
        BlocProvider<PayrollCubit>(create: (_) => getIt<PayrollCubit>()),
        BlocProvider<MyTasksCubit>(create: (_) => getIt<MyTasksCubit>()),
        BlocProvider<ProfileCubit>(create: (_) => getIt<ProfileCubit>()),
        BlocProvider<LoginCubit>(create: (_) => getIt<LoginCubit>()),
        BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
        BlocProvider<LanguageCubit>(create: (_) => getIt<LanguageCubit>()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            locale: state,
            theme: ThemeData(
              fontFamily: $styles.text.body.fontFamily,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: $styles.text.h5.copyWith(),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: $styles.text.button.copyWith(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  surfaceTintColor: Colors.black,
                  backgroundColor: $styles.colors.accent,
                  padding: EdgeInsets.all($styles.insets.md),
                ),
              ),
            ),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        },
      ),
    );
  }
}

import 'package:aswar/common_libs.dart';
import 'package:aswar/di/injection.dart';
import 'package:aswar/src/home/home.dart';
import 'package:aswar/src/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AswarApp extends StatefulWidget {
  const AswarApp({super.key});

  @override
  State<AswarApp> createState() => _AswarAppState();
}

class _AswarAppState extends State<AswarApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => getIt.get<LoginCubit>()),
        BlocProvider<HomeCubit>(create: (_) => getIt.get<HomeCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationProvider: _appRouter.routeInfoProvider(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          fontFamily: $styles.text.body.fontFamily,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: $styles.text.button,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular($styles.corners.md),
              ),
              padding: EdgeInsets.all($styles.insets.sm),
            ),
          ),
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}

import 'package:aswar/common_libs.dart';

class AswarApp extends StatefulWidget {
  const AswarApp({super.key});

  @override
  State<AswarApp> createState() => _AswarAppState();
}

class _AswarAppState extends State<AswarApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final pageContent = Scaffold(
          body: child,
          resizeToAvoidBottomInset: false,
        );

        return pageContent;
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(fontFamily: $styles.text.body.fontFamily),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

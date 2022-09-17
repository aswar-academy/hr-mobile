import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final pageContent = Stack(
          children: [
            if (child != null) child,
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                final shared = snapshot.data;
                if (shared == null) return const SizedBox.shrink();

                final registration = shared.get(Preferences.registration);

                print("App: ${registration}");
                return FloatingActionButton.small(
                  backgroundColor:
                      registration == null ? Colors.red : Colors.green,
                  onPressed: () async {
                    await shared.clear();
                    setState(() {});
                  },
                  child: const Text("clear"),
                );
              },
            ),
          ],
        );

        return pageContent;
      },
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
    );
  }
}

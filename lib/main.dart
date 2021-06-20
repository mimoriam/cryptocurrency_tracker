import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Models:

// Screens:

// Services:

// State:
import 'package:provider/provider.dart';
import 'package:cryptocurrency_tracker/state/themeProvider.dart';

// Widgets:

// Custom:
import 'package:beamer/beamer.dart';
import 'package:cryptocurrency_tracker/utils/appRoutes.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeNotifier(),
        )
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: appRoutes,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
    );
  }
}

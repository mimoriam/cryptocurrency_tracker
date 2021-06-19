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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ThemeNotifier())
      ],
      child: MyApp(),
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
    );
  }
}

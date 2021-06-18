import 'package:flutter/material.dart';

// Models:

// Screens:
import 'package:cryptocurrency_tracker/screens/homeScreen.dart';

// Services:

// State:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Widgets:

// Custom:
import 'package:beamer/beamer.dart';
import 'package:cryptocurrency_tracker/utils/appRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
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

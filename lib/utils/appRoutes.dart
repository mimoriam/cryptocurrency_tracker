import 'package:flutter/material.dart';

// Models:

// Screens:
import 'package:cryptocurrency_tracker/screens/homeScreen.dart';

// Services:

// State:

// Widgets:

// Custom:

import 'package:beamer/beamer.dart';

final appRoutes = SimpleLocationBuilder(
  routes: {
    '/': (context, state) => BeamPage(
          key: ValueKey('Home'),
          title: 'Home',
          child: HomeScreen(),
        ),
  },
);

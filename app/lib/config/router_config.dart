import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_analyzer_app/screens/home_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: "/", builder: (context, state) => HomeScreen()),
    GoRoute(path: "/settings", builder: (context, state) => Container()),
  ],
);

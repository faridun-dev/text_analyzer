import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_analyzer_app/screens/main_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: "/", builder: (context, state) => MainScreen()),
    GoRoute(path: "/settings", builder: (context, state) => Container()),
  ],
);

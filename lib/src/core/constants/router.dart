import 'package:flutter/material.dart';
import 'package:river_raddit/src/feature/auth/screen/login_screen.dart';
import 'package:river_raddit/src/feature/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  "/": (route) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  "/": (route) => const MaterialPage(child: HomeScreen()),
});

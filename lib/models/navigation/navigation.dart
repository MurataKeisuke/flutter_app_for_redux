import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String homeRoute = '/';
  static const String counterRoute = '/counter';
  static const String awesomeDialogRoute = '/awesome-dialog';
  static const String percentIndicatorRoute = '/percent-indicator';
  static const String circularPercentIndicatorRoute = '/circular';
  static const String linearPercentIndicatorRoute = '/linear';
}
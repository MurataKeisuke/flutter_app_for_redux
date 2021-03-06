import 'package:flutter/material.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/screens/home_screen.dart';
import 'package:redux_app/screens/counter_screen.dart';
import 'package:redux_app/screens/awesome_dialog/awesome_dialog_screen.dart';
import 'package:redux_app/screens/percent_indicator/percent_indicator_screen.dart';
import 'package:redux_app/screens/percent_indicator/circular_percent_indicator_screen.dart';
import 'package:redux_app/screens/percent_indicator/linear_percent_indicator_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MainRoute<dynamic>(
            const HomeScreen('Flutter Redux Home Page'),
            settings: settings,
        );
      case AppRoutes.counterRoute:
        return SubRoute<dynamic>(
            const CounterScreen('Counter Page'),
            settings: settings,
        );
      case AppRoutes.awesomeDialogRoute:
        return MainRoute<dynamic>(
          DialogSampleScreen(),
          settings: settings,
        );
      case AppRoutes.percentIndicatorRoute:
        return MainRoute<dynamic>(
          PercentIndicatorScreen(),
          settings: settings,
        );
      case AppRoutes.circularPercentIndicatorRoute:
        return SubRoute<dynamic>(
          CircularPercentIndicatorScreen(),
          settings: settings,
        );
      case AppRoutes.linearPercentIndicatorRoute:
        return SubRoute<dynamic>(
          LinearPercentIndicatorScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route x defined for ${settings.name}')),
            ));
    }
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(builder: (_) =>
      RouteAwareWidget(child: widget), settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

//    if (settings.isInitialRoute) {
//      return child;
//    }
    return FadeTransition(opacity: animation, child: child);
  }
}

class SubRoute<T> extends MaterialPageRoute<T> {
  SubRoute(Widget widget, {RouteSettings settings})
      : super(builder: (_) =>
      RouteAwareWidget(child: widget), settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

//    if (settings.isInitialRoute) {
//      return child;
//    }
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
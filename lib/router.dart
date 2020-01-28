import 'package:flutter/material.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/screens/home_screen.dart';
import 'package:redux_app/screens/counter_screen.dart';
import 'package:redux_app/containers/routes/route_aware_widget.dart';

class Router {

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MainRoute(
            HomeScreen('Flutter Redux Home Page'), settings: settings);
      case AppRoutes.counterRoute:
        return SubRoute(
            const CounterScreen('Counter Page'), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                      child: Text('No route x defined for ${settings.name}')),
                ));
    }
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings}) : super(builder: (_) => RouteAwareWidget(child: widget), settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }

    return FadeTransition(opacity: animation, child: child);
    }
  }
}

class SubRoute<T> extends MaterialPageRoute<T> {
  SubRoute(Widget widget, {RouteSettings settings}) : super(builder: (_) => RouteAwareWidget(child: widget), settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }

    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
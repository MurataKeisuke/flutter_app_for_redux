import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  const RouteAwareWidget({this.child});

  final Widget child;

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState(child: child);
}

class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  RouteAwareWidgetState({this.child});
  
  final Widget child;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    StoreProvider.of<AppState>(context).dispatch(NavigatePopAction());
  }

  @override
  Widget build(BuildContext context) => Container(child: child);
}
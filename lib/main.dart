import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/containers/routes/route_aware_widget.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_app/screens/home_screen.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/app_reducer.dart';
import 'package:redux_app/router.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  final String title = 'Flutter Demo Home Page';
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState(),
//    middleware: [LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux',
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen('Flutter Redux Home Page'),
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}

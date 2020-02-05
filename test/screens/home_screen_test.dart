import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/app_reducer.dart';
import 'package:redux_app/middlewares/navigation_middleware.dart';
import 'package:redux_app/screens/counter_screen.dart';
import 'package:redux_app/screens/home_screen.dart';
import 'package:redux_app/router.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('HomeScreenのテスト', () {
    NavigatorObserver mockObserver;

    final store = Store<AppState>(
        appReducer,
        initialState: const AppState(),
        middleware: createNavigationMiddleware(),
    );

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<Null> _buildMainPage(WidgetTester tester) async {
      await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: const HomeScreen('Home'),
          navigatorKey: navigatorKey,
          navigatorObservers: [mockObserver],
          onGenerateRoute: Router.generateRoute,
        )
      ));

      verify(mockObserver.didPush(any, any));
    }

    testWidgets(
      'AppBarが表示されていることを確認',
          (WidgetTester tester) async {
        await _buildMainPage(tester);

//        expect(find.byWidget(
//            AppBar(title: Text('Home'))
//        ), findsOneWidget);
          expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets(
        'CounterをタップすることでCounterPageに遷移する',
        (WidgetTester tester) async {
      await _buildMainPage(tester);

      await tester.tap(find.byKey(HomeScreen.counterTileKey));
      await tester.pumpAndSettle();

      verify(mockObserver.didPush(any, any));

      expect(find.byType(CounterScreen), findsOneWidget);
    });


  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/app_reducer.dart';
import 'package:redux_app/middlewares/navigation_middleware.dart';

class MockMiddleware extends Mock implements MiddlewareClass<AppState> {}

void main() {
  group('NavigationMiddlewareのテスト', () {
    final mockMiddleware = MockMiddleware();

    final store = Store<AppState>(
        appReducer,
        initialState: const AppState(),
        middleware: [
          mockMiddleware,
          ...createNavigationMiddleware(),
        ],
    );

    // 各テスト後にmockMiddlewareを初期化
    tearDown(() {
      reset(mockMiddleware);
    });

    test('NavigateReplaceActionが発火した場合、Middlewareで該当する処理がCallされる', () async {
      // Action発火
      store.dispatch(NavigateReplaceAction(AppRoutes.counterRoute));

      // 該当の処理がCallされているか、Actionの引数が正しいか
      verify<void>(
        mockMiddleware.call(
          store,
          predicate<NavigateReplaceAction>(
              (action) {
                return action is NavigateReplaceAction
                    && action.routeName == AppRoutes.counterRoute;
              }
          ),
          any,
        )
      );
    });

    test('NavigatePushActionが発火した場合、Middlewareで該当する処理がCallされる', () async {
      // Action発火
      store.dispatch(NavigatePushAction(AppRoutes.counterRoute));

      // 該当の処理がCallされているか、Actionの引数が正しいか
      verify<void>(
          mockMiddleware.call(
            store,
            predicate<NavigatePushAction>(
                    (action) {
                  return action is NavigatePushAction
                      && action.routeName == AppRoutes.counterRoute;
                }
            ),
            any,
          )
      );
    });

  });
}

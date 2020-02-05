import 'package:test/test.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/app_reducer.dart';

void main() {
  group('NavigationReducerのテスト', () {
    final store = Store<AppState>(appReducer, initialState: const AppState());

    test('NavigateReplaceActionが発火することでstate.routeが引数のルート名に置き換わる', () {
      store.dispatch(NavigateReplaceAction(AppRoutes.homeRoute));

      expect(store.state.route.length, 1);
      expect(store.state.route[0], AppRoutes.homeRoute);
    });

    test('NavigatePushActionが発火することでstate.routeに引数のルート名が追加される', () {
      store.dispatch(NavigatePushAction(AppRoutes.counterRoute));

      expect(store.state.route.length, 2);
      expect(store.state.route[1], AppRoutes.counterRoute);
    });

    test('NavigatePpoActionが発火することでstate.routeの最後の要素を取り除く', () {
      store.dispatch(NavigatePopAction());

      expect(store.state.route.length, 1);
      expect(store.state.route[0], AppRoutes.homeRoute);
    });
  });
}
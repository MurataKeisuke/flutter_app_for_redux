import 'package:test/test.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/app_reducer.dart';

void main() {
  group('CounterReducerのテスト', () {
    final store = Store<AppState>(appReducer, initialState: const AppState());

    test('IncrementCountActionが発火することでstate.countが＋１される', () {
      store.dispatch(IncrementCountAction());

      expect(store.state.count, 1);
    });

    test('DecrememtCountActionが発火することでstate.countが−１される', () {
      store.dispatch(DecrememtCountAction());

      expect(store.state.count, 0);
    });
  });
}
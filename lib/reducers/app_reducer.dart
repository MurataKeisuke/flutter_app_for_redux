import 'package:redux_app/models/models.dart';
import 'package:redux_app/reducers/counter_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    isLoading: false,
    count: counterReducer(state.count, action),
  );
}
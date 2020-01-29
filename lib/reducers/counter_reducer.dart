import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, IncrementCountAction>(_incrementCount),
  TypedReducer<int, DecrememtCountAction>(_decrementCount),
]);

int _incrementCount(int count, IncrementCountAction action) => count + 1;

int _decrementCount(int count, DecrememtCountAction action) => count - 1;
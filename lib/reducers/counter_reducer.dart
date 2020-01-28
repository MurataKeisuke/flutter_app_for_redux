import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, IncrementCountAction>(_incrementCount),
  TypedReducer<int, DecrememtCountAction>(_decrementCount),
]);

int _incrementCount(int count, IncrementCountAction action) {
  count++;
  return count;
}

int _decrementCount(int count, DecrememtCountAction action) {
  count--;
  return count;
}

//int counterReducer(int currentCount, action) {
//  if (action is IncrementCountAction) {
//    currentCount++;
//    return currentCount;
//  } else if (action is DecrememtCountAction) {
//    currentCount--;
//    return currentCount;
//  } else {
//    return currentCount;
//  }
//}
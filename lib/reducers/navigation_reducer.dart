import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';

final navigationReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, NavigateReplaceAction>(_navigateReplace),
  TypedReducer<List<String>, NavigatePushAction>(_navigatePush),
  TypedReducer<List<String>, NavigatePopAction>(_navigatePop),
]);

List<String> _navigateReplace(
    List<String> route,
    NavigateReplaceAction action
    ) {
  return [action.routeName];
}

List<String> _navigatePush(
    List<String> route,
    NavigatePushAction action
    ) {
  final result = List<String>.from(route);
  return result.add(action.routeName) as List<String>;
}

List<String> _navigatePop(List<String> route, NavigatePopAction action) {
  final result = List<String>.from(route);
  return result.removeLast() as List<String>;
}
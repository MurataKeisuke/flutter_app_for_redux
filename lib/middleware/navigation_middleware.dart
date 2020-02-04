import 'package:redux/redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigatePush),
  ];
}

void _navigateReplace(
    Store<AppState> store,
    NavigateReplaceAction action,
    NextDispatcher next,
    ) {
  final routeName = action.routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

void _navigatePush(
    Store<AppState> store,
    NavigatePushAction action,
    NextDispatcher next
    ) {
  final routeName = action.routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}
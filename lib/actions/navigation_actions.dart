class NavigateReplaceAction {
  NavigateReplaceAction(this.routeName);

  final String routeName;

  @override
  String toString() {
    return 'NavigateReplaceAction{routeName: $routeName}';
  }
}

class NavigatePushAction {
  NavigatePushAction(this.routeName);

  final String routeName;

  @override
  String toString() {
    return 'NavigatePushAction{routeName: $routeName}';
  }
}

class NavigatePopAction {

  @override
  String toString() {
    return 'NavigatePopAction';
  }
}
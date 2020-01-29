import 'package:redux_app/models/models.dart';

class AppState {
  final bool isLoading;
  final int count;
  final List<String> route;

  AppState({
    this.isLoading = false,
    this.count = 0,
    this.route = const [AppRoutes.homeRoute],
  });

  AppState copyWith({
    bool isLoading,
    int count,
    List<String> route,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      count: count ?? this.count,
      route: route ?? this.route,
    );
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, count: $count, route: $route}';
  }
}
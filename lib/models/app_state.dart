
class AppState {
  final bool isLoading;
  final int count;
  final List<String> route;

  AppState({
    this.isLoading = false,
    this.count = 0,
    this.route
  });

  AppState copyWith({int count, bool isLoading}) {
    return AppState(
        count: count ?? this.count,
        isLoading: isLoading ?? this.isLoading
    );
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, count: $count}';
  }
}
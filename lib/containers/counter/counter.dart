import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/models/models.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return  Text(
            vm.count.toString(),
            style: Theme.of(context).textTheme.display1,
          );
        }
    );
  }
}

class _ViewModel {
  _ViewModel({
    @required this.count,
  });

  _ViewModel.fromStore(Store<AppState> store) : count = store.state.count;

  final int count;

}
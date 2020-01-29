import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';

class HomeScreen extends StatelessWidget {
  String title;

  HomeScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: const Text('Counter'),
              onTap: () {
                _onTapList(context, AppRoutes.counterRoute);
              },
            )
          ],
        ),
      ),
    );
  }

  void _onTapList(BuildContext _context, String routeName) {
    StoreProvider.of<AppState>(_context).dispatch(NavigatePushAction(routeName));
  }
}

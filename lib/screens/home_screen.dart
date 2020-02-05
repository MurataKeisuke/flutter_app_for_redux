import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.title);

  static const Key counterTileKey = Key('counterTile');

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _tile(
                counterTileKey,
                'Counter',
                'go to Counter Page',
                Icons.add,
                AppRoutes.counterRoute,
                context,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  ListTile _tile(
      Key key,
      String title,
      String subTitle,
      IconData icon,
      String pushRoute,
      BuildContext _context,
  ) {
    return ListTile(
      key: key,
      title: Text(title, style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
      subtitle: Text(subTitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      onTap: () {
        _onTapList(_context, pushRoute);
      },
    );
  }

  void _onTapList(BuildContext _context, String routeName) {
    StoreProvider.of<AppState>(_context)
        .dispatch(NavigatePushAction(routeName));
  }
}

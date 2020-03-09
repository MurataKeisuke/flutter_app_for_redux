import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PercentIndicatorScreen extends StatelessWidget {

  static const Key circularTileKey = Key('circularTile');
  static const Key linearTileKey = Key('linearTileKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percent indicator sample'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _tile(
              circularTileKey,
              'Circular percent indicator',
              'show Linear percent indicator Sample',
              MaterialIcons.pause_circle_filled,
              AppRoutes.circularPercentIndicatorRoute,
              context,
            ),
            const Divider(),
            _tile(
              linearTileKey,
              'Linear percent indicator',
              'show Linear percent indicator Sample',
              MaterialIcons.line_style,
              AppRoutes.linearPercentIndicatorRoute,
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

import 'package:flutter/material.dart';
import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/actions/actions.dart';
import 'package:redux_app/models/models.dart';

class DialogSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fancy Dialog Example'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              AnimatedButton(
                text: 'Issue Dialog',
                pressEvent: () {
                  showAlertDialogOnOkCallback(
                      'Verified',
                      'Sign In Success!, prees Ok to navigate.',
                      DialogType.SUCCES,
                      context,
                      () => StoreProvider.of<AppState>(context)
                          .dispatch(NavigatePushAction(AppRoutes.homeRoute)),
                  );
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Info Dialog',
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      tittle: 'INFO',
                      desc:
                      'Dialog description here',
                      btnCancelOnPress: () {},
                      btnOkOnPress: showDebugPrint)
                      .show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Info Dialog Without buttons',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: false,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    tittle: 'INFO',
                    desc: 'Dialog de.',
                  ).show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Warning Dialog',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      headerAnimationLoop: false,
                      animType: AnimType.TOPSLIDE,
                      tittle: 'Warning',
                      desc:
                      'Dialog description here',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {})
                      .show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Error Dialog',
                color: Colors.red,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      headerAnimationLoop: false,
                      tittle: 'Error',
                      desc:
                      'Dialog description here',
                      btnOkOnPress: () {},
                      btnOkColor: Colors.red)
                      .show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Succes Dialog',
                color: Colors.green,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      headerAnimationLoop: false,
                      dialogType: DialogType.SUCCES,
                      tittle: 'Succes',
                      desc:
                      'Dialog description here',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDissmissCallback: () {
                        debugPrint('Dialog Dissmiss from callback');
                      }).show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Custom Body Dialog',
                color: Colors.blueGrey,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    body: const Center(
                      child: Text(
                        'If the body is specified,'
                            ' then title and description will be ignored,'
                            ' this allows to further customize the dialogue.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    tittle: 'This is Ignored',
                    desc: 'This is also Ignored',
                  ).show();
                },
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                text: 'Custom Buttons Dialog',
                color: Colors.brown,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    customHeader: Icon(
                      Icons.face,
                      size: 50,
                    ),

                    tittle: 'This is Custom',
                    desc: 'This is custom button and header',
                    btnOk: FlatButton(
                      child: const Text('Custom Button'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    //this is ignored
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialogOnOkCallback(String title, String msg,
      DialogType dialogType, BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: dialogType,
      tittle: title,
      desc: msg,
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.green.shade900,
      btnOkOnPress: onOkPress,
    ).show();
  }

  void showDebugPrint() {
    debugPrint('Print from Callback Function');
  }
}


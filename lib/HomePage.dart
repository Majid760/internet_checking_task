import 'package:flutter/material.dart';
import 'package:internet_checking_task/api_controller.dart';
import 'package:internet_checking_task/utility.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network status finder'),
      ),
      body: Center(
        child: Consumer<ApiController>(
            builder: (BuildContext context, apiController, Widget? child) =>
                ElevatedButton(
                    onPressed: () async {
                      bool isTrue = await Utility.checkNetworkStatus();
                      if (isTrue) {
                        showAlertDialog(context, 'Connected',
                            'your are connected to internet!');
                        ApiController().getDatafromApi();
                      } else {
                        showAlertDialog(context, 'Not Connected',
                            'check your internet connection!');
                      }
                    },
                    child: const Text('Get Data'))),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
    // Create button
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

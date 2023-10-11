import 'package:beauty_salon/src/Helpers/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_empty.dart';
import 'app_loader.dart';

class CustomWidgetBody extends StatefulWidget {
  final String? labal;
  final body;
  final service;

  const CustomWidgetBody({Key? key, this.body, this.service, this.labal})
      : super(key: key);
  @override
  _CustomWidgetBodyState createState() => _CustomWidgetBodyState();
}

class _CustomWidgetBodyState extends State<CustomWidgetBody> {
  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return connectionStatus != ConnectivityStatus.Offline
        ? FutureBuilder(
            future: widget.service,
            builder: (context, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: AppLoader(),
                );
              } else {
                if (dataSnapshot.error != null) {
                  print(dataSnapshot.error);
                  return Center(
                    child: Text('هناك خطا يرجي اعادة المحاولة'),
                  );
                } else {
                  return dataSnapshot.data!.data == null ||
                          dataSnapshot.data.data == []
                      ? AppEmpty(text: widget.labal)
                      : widget.body;
                }
              }
            },
          )
        : Center(
            child: Text('يرجآ التاكد من الاتصال بالانترنت'),
          );
  }
}

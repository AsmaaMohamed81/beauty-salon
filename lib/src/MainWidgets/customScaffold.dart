
import 'package:beauty_salon/src/Helpers/connectivity_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_empty.dart';
import 'app_loader.dart';

class CustomScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final Function onRefresh;
  final body;
  final service;

  final floatingActionButton;
  final backgroundColor;
  final resizeToAvoidBottomInset;

  const CustomScaffold(
      {Key key, this.appBar, this.body, this.service, this.onRefresh, this.floatingActionButton, this.backgroundColor, this.resizeToAvoidBottomInset})
      : super(key: key);
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefresh();
        await Future.value({});
      },
      child: Scaffold(
          appBar: widget.appBar,
          backgroundColor: widget.backgroundColor,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          floatingActionButton: widget.floatingActionButton,
          body: connectionStatus != ConnectivityStatus.Offline
              ? FutureBuilder(
            future: widget.service,
            builder: (context, dataSnapshot) {
              if (dataSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: AppLoader(),
                );
              } else {
                if (dataSnapshot.error != null) {
                  print(dataSnapshot.error);
                  return Center(
                    child: Text(tr("There is an error please try again")),
                    // child: Text('هناك خطا يرجي اعادة المحاولة'),
                  );
                } else {
                  return dataSnapshot.data == null ||
                      dataSnapshot.data == []
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: AppEmpty(),
                      ),
                      IconButton(
                        icon: Icon(Icons.replay_outlined),
                        onPressed: () => widget.onRefresh(),)
                    ],
                  )
                      : widget.body;
                }
              }
            },
          )
              : Center(
            child: Text(tr("Please make sure you are connected to the internet")),
          )),
    );
  }
}

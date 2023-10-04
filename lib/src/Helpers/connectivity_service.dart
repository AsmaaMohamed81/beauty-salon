import 'dart:async';

import 'package:connectivity/connectivity.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather Offers info if you need t
      //  DataConnectionChecker().onStatusChange.listen((event) { });
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        print("ConnectivityStatus Cellular");
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        print("ConnectivityStatus WiFi");
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        print("ConnectivityStatus Offline");
        return ConnectivityStatus.Offline;
      default:
        print("ConnectivityStatus Offline");
        return ConnectivityStatus.Offline;
    }
  }
}

enum ConnectivityStatus { WiFi, Cellular, Offline }

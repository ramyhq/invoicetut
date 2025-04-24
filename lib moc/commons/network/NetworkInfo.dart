import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfoChecker {
  Future<bool> get isConnected;
}

class NetworkInfoCheckerImpl implements NetworkInfoChecker {
  final DataConnectionChecker connectionChecker;

  NetworkInfoCheckerImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}


///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


import 'package:connectivity_plus/connectivity_plus.dart';

///
/// This is Using Another Package (connectivity_plus: ^5.0.2)
///

// For checking internet connectivity
abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfoImp implements NetworkInfo {
  Connectivity connectivity;

  static final NetworkInfoImp _networkInfo = NetworkInfoImp._internal(Connectivity());

  factory NetworkInfoImp() {
    return _networkInfo;
  }

  NetworkInfoImp._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

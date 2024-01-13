import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_connectivity/networking/bloc/network_connectivity_event.dart';
import 'package:bloc_connectivity/networking/bloc/network_connectivity_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// A BLoC (Business Logic Component) that monitors network connectivity changes.
///
/// This BLoC listens to changes in network connectivity using the `Connectivity`
/// package and emits corresponding events based on the connectivity status.
class NetworkConnectivityBloc
    extends Bloc<NetworkConnectivityEvent, NetworkConnectivityState> {
  /// Stream subscription to monitor connectivity changes.
  StreamSubscription? streamSubscription;

  /// Initializes the [NetworkConnectivityBloc] with an initial state of
  /// [NetworkConnectivityInitial].
  NetworkConnectivityBloc() : super(NetworkConnectivityInitial()) {
    // Listen to the OnConnected and OnDisconnected events and emit
    // NetworkConnectivityOnline and NetworkConnectivityOffline states, respectively.
    on<OnConnected>((event, emit) => emit(NetworkConnectivityOnline()));
    on<OnDisconnected>((event, emit) => emit(NetworkConnectivityOffline()));

    // Subscribe to the Connectivity package's onConnectivityChanged stream
    // to monitor changes in network connectivity.
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectResult) {
      if (connectResult == ConnectivityResult.mobile ||
          connectResult == ConnectivityResult.wifi) {
        // If the connectivity is mobile or wifi, add the OnConnected event.
        add(OnConnected());
      } else {
        // If the connectivity is not mobile or wifi, add the OnDisconnected event.
        add(OnDisconnected());
      }
    });
  }

  /// Overrides the close method to cancel the stream subscription
  /// before closing the BLoC.
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'network_connectivity_event.dart';
part 'network_connectivity_state.dart';

class NetworkConnectivityBloc
    extends Bloc<NetworkConnectivityEvent, NetworkConnectivityState> {
  StreamSubscription? streamSubscription;
  NetworkConnectivityBloc() : super(NetworkConnectivityInitial()) {
    on<OnConnected>((event, emit) => emit(NetworkConnectivityOnline()));
    on<OnDisconnected>((event, emit) => emit(NetworkConnectivityOffline()));
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectResult) {
      if (connectResult == ConnectivityResult.mobile ||
          connectResult == ConnectivityResult.wifi) {
        add(OnConnected());
      } else {
        add(OnDisconnected());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}

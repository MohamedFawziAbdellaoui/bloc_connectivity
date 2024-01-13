/// Part of the 'network_connectivity_bloc.dart' file.
// Contains the event classes related to network connectivity for the [NetworkConnectivityBloc].

/// Abstract base class for network connectivity events.
abstract class NetworkConnectivityEvent {}

/// Event representing the state when the device is connected to the network.
class OnConnected extends NetworkConnectivityEvent {}

/// Event representing the state when the device is disconnected from the network.
class OnDisconnected extends NetworkConnectivityEvent {}

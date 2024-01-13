/// Part of 'network_connectivity_bloc.dart'.
/// Contains the state classes related to network connectivity for the [NetworkConnectivityBloc].
/// Sealed abstract base class for network connectivity states.
sealed class NetworkConnectivityState {}

/// Represents the initial state of network connectivity.
class NetworkConnectivityInitial extends NetworkConnectivityState {}

/// Represents the state when the device is online and connected to the network.
class NetworkConnectivityOnline extends NetworkConnectivityState {}

/// Represents the state when the device is offline and disconnected from the network.
class NetworkConnectivityOffline extends NetworkConnectivityState {}

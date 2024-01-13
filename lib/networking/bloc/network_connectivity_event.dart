part of 'network_connectivity_bloc.dart';

abstract class NetworkConnectivityEvent {}

class OnConnected extends NetworkConnectivityEvent {}

class OnDisconnected extends NetworkConnectivityEvent {}

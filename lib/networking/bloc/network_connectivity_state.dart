part of 'network_connectivity_bloc.dart';

sealed class NetworkConnectivityState {}

class NetworkConnectivityInitial extends NetworkConnectivityState {}

class NetworkConnectivityOnline extends NetworkConnectivityState {}

class NetworkConnectivityOffline extends NetworkConnectivityState {}

// Import necessary packages and files
import 'package:bloc_connectivity/networking/bloc/network_connectivity_bloc.dart';
import 'package:bloc_connectivity/networking/bloc/network_connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// NetworkChecker widget for handling network connectivity and displaying an alert dialog
class NetworkChecker extends StatefulWidget {
  // Main content of the application
  final Widget child;

  // Alert dialog to be displayed when network connection is lost
  final AlertDialog networkOffDialog;

  // Constructor to initialize the widget with child and networkOffDialog
  const NetworkChecker({
    super.key,
    required this.child,
    required this.networkOffDialog,
  });

  // Create the state for the NetworkChecker widget
  @override
  State<NetworkChecker> createState() => _NetworkCheckerState();
}

// State class for the NetworkChecker widget
class _NetworkCheckerState extends State<NetworkChecker> {
  // Flag to control whether the dialog is disabled or not
  bool isDialogDisabled = true;

  // Build method to define the appearance of the widget
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the NetworkConnectivityBloc to the widget tree
      create: (context) => NetworkConnectivityBloc(),
      child: BlocListener<NetworkConnectivityBloc, NetworkConnectivityState>(
        // Listen for changes in network connectivity state
        listener: (context, state) {
          if (state is NetworkConnectivityOffline) {
            // Handle network offline state
            isDialogDisabled = true;
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return widget.networkOffDialog; // Use provided networkOffDialog
              },
            );
          } else {
            // Handle network online state
            isDialogDisabled = false;
          }
        },
        // Display the main content of the application
        child: widget.child,
      ),
    );
  }
}

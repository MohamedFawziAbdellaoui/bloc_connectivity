import 'package:bloc_connectivity/networking/bloc/network_connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkChecker extends StatefulWidget {
  final Widget child;
  final AlertDialog networkOffDialog;
  const NetworkChecker({super.key, required this.child, required this.networkOffDialog});

  @override
  State<NetworkChecker> createState() => _NetworkCheckerState();
}

class _NetworkCheckerState extends State<NetworkChecker> {
  bool isDialogDisabled = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkConnectivityBloc(),
      child: BlocListener<NetworkConnectivityBloc, NetworkConnectivityState>(
            listener: (context, state) {
              if (state is NetworkConnectivityOffline) {
                isDialogDisabled = true;
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Network Offline'),
                      content:
                          const Text('Please check your internet connection.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (!isDialogDisabled) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                isDialogDisabled = false;
              }
            },
            child: widget.child,
          ),
    );
  }
}

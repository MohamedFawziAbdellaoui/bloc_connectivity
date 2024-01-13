// example/main.dart
import 'package:bloc_connectivity/bloc_connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  // Example usage of the NetworkChecker widget
  runApp(
    NetworkChecker(
      networkOffDialog: AlertDialog(
        title: const Text('Network Offline'),
        content: const Text('Please check your internet connection.'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle retry action
            },
            child: const Text('Retry'),
          ),
        ],
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to my app!'),
      ),
    );
  }
}

# bloc_connectivity

A Flutter package that provides a `NetworkChecker` widget to handle network connectivity in your app.

## Getting Started

1. Install the package by adding it to your `pubspec.yaml` file:

```yaml
dependencies:
  bloc_connectivity: ^1.0.0

```
2. Import the package in your Dart code:
```dart
import 'package:bloc_connectivity/bloc_connectivity.dart';
```
3. Use the NetworkChecker widget to handle network connectivity in your app:
```dart

import 'package:flutter/material.dart';
import 'package:bloc_connectivity/bloc_connectivity.dart';

void main() {
  runApp(
    NetworkChecker(
      child: MyApp(),
      networkOffDialog: AlertDialog(
        title: Text('Network Offline'),
        content: Text('Please check your internet connection.'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle retry action
            },
            child: Text('Retry'),
          ),
        ],
      ),
    ),
  );
}
```
4. statFor more detailed examples, see example/README.md.







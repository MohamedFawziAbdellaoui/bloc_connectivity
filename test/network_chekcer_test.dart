import 'package:bloc_connectivity/network_checker.dart';
import 'package:bloc_connectivity/networking/bloc/network_connectivity_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_connectivity/networking/bloc/network_connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockNetworkConnectivityBloc extends Mock
    implements NetworkConnectivityBloc {}

void main() {
  late MockNetworkConnectivityBloc mockBloc;

  setUp(() {
    mockBloc = MockNetworkConnectivityBloc();
  });

  testWidgets('NetworkChecker shows dialog when offline',
      (WidgetTester tester) async {
    // Mock the bloc state to simulate offline connectivity
    when(mockBloc.state).thenReturn(NetworkConnectivityOffline());

    await tester.pumpWidget(
      MaterialApp(
        home: NetworkChecker(
          networkOffDialog: AlertDialog(
            title: const Text('Network Offline'),
            content: const Text('Please check your internet connection.'),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Retry'),
              ),
            ],
          ),
          child: Container(),
        ),
      ),
    );

    // Verify that the AlertDialog is displayed
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verify the contents of the AlertDialog
    expect(find.text('Network Offline'), findsOneWidget);
    expect(find.text('Please check your internet connection.'), findsOneWidget);

    // You can also interact with the dialog's buttons if needed
    // For example, tap the "Retry" button
    await tester.tap(find.text('Retry'));
    // Add additional verification or assertions if needed
  });
}

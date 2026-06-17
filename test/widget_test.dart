import 'package:flutter_test/flutter_test.dart';
import 'package:signbridge/main.dart';

void main() {
  testWidgets('SignBridge boots and shows Splash Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SignBridgeApp());

    // Verify that Splash screen components are rendered
    expect(find.text('SignBridge'), findsOneWidget);
    expect(find.text('Every sign builds a bridge.'), findsOneWidget);
  });
}

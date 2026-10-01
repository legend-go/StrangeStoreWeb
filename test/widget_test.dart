import 'package:flutter_test/flutter_test.dart';
import 'package:strangestoreweb/app/app.dart';

void main() {
  testWidgets('StrangeStoreApp initialization smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StrangeStoreApp());

    // Verify that the initialization text is present.
    expect(find.text('Strange Store Initialized'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_bite/app.dart';

void main() {
  testWidgets('PocketBite app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const PocketBiteApp());

    expect(find.text('PocketBite'), findsOneWidget);
  });
}
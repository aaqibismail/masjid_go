import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Example", (WidgetTester tester) async {
    expect(2 + 2, equals(4));
  });
}
import 'package:super_base_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Complete App Navigation Flux', (WidgetTester tester) async {
    // Load the APP
    await tester.pumpWidget(MyApp());
  });
}
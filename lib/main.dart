import 'package:flutter/material.dart';
import 'package:product_list/features/products/presentation/pages/products_page.dart';
import 'core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductsPage(),
    );
  }
}

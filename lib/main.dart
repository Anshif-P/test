import 'package:flutter/material.dart';
import 'package:live_test/core/feature/home/data/local/local_storage.dart';
import 'package:live_test/core/feature/home/presentation/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper().database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

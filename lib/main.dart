import 'package:flutter/material.dart';
import 'package:search_item/page/search_item.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SearchItem.routeName.toString(),
      routes: {SearchItem.routeName.toString(): (context) => SearchItem()},
    );
  }
}

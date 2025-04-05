import 'package:flutter/material.dart';
import 'package:search_projeto_example/src/pages/home_page.dart';
import 'package:search_projeto_example/src/pages/seach_controller_page.dart';
import 'package:search_projeto_example/src/pages/search_page.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SearchAnchor Example',
      home: HomePage(),
      routes: {
        '/search_controller': (_) => SeachControllerPage(),
        '/search_page': (_) => SearchPage(),
      },
    );
  }
}

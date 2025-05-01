import 'package:flutter/material.dart';
import 'pages/char_list_page.dart';

void main() {
  runApp(WikiNarutoApp());
}

class WikiNarutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WikiNaruto',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CharacterListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

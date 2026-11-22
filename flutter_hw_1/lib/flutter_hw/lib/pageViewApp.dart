import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Пример page view'),
          backgroundColor: const Color.fromARGB(255, 217, 47, 247),

          centerTitle: true,
        ),
        body: PageView(
          children: [
            page('Welcom', Colors.blueAccent),
            page('Flutter', Colors.pinkAccent),
            page('Courses', Colors.purple),
          ],
        ),
      ),
    );
  }
}

Widget page(String text, Color color) {
  return Container(
    color: color,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class NavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Первый экран'),
        backgroundColor: const Color.fromARGB(255, 225, 104, 192),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Text('Перейти на второй экран'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Второй экран'),
        backgroundColor: const Color.fromARGB(255, 225, 104, 192),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
          },
          child: Text('Перейти на третий экран'),
        ),
      ),
    );
  }
}



class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Третий экран'),
        backgroundColor: const Color.fromARGB(255, 225, 104, 192),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.popUntil(context, (route) => route.isFirst
            );
          },
           child: Text('Вернуться на первый экран'),
           ),
           ),
    );
  }
}

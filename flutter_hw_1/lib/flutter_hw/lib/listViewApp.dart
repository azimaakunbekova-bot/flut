import 'package:flutter/material.dart';

class ListviewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Список учеников'),
          backgroundColor: const Color.fromARGB(255, 131, 232, 134),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Студенты'),
          SizedBox( height: 20),
          Text('ФИО студентов \n' * 35),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){}, child: Text('На главной странице'),),
          ],),

        ),
      ),
    );
   
  }

}
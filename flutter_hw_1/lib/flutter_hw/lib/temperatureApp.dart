import 'package:flutter/material.dart';

class TemperatureApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemperatureAppState();
}

class TemperatureAppState extends State<TemperatureApp> {
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Счетчик температуры'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 118, 4, 107),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Температура', style: TextStyle(fontSize: 32)),
              SizedBox(height: 8),

              Text(
                '$temp градусов',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: temp > 0 ? Colors.deepPurple : Colors.green,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp--;
                      });
                    },
                    child: Text('Уменьшить'),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp++;
                      });
                    },
                    child: Text('Увеличить'),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp = 0;
                      });
                    },
                    child: Text('Сброс'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

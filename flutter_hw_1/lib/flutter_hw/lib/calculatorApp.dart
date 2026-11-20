import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  String op = '';

  double result = 0;

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
      op = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 100, 186),
      appBar: AppBar(
        title: Text('Berry-калькуратор'),
        backgroundColor: const Color.fromARGB(255, 186, 28, 149),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите первое число',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите второе число',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op = '+';
                      result = firstValue + secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 8, 170),
                    foregroundColor: const Color.fromARGB(255, 192, 224, 193),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(16),
                  ),

                  child: Text('+', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op = '-';
                      result = firstValue - secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 8, 170),
                    foregroundColor: const Color.fromARGB(255, 192, 224, 193),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(16),
                  ),

                  child: Text('-', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op = '*';
                      result = firstValue * secondValue;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 8, 170),
                    foregroundColor: const Color.fromARGB(255, 192, 224, 193),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(16),
                  ),

                  child: Text('x', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op = '÷';
                      if (secondValue == 0) {
                        result = 0;
                      } else {
                        result = firstValue / secondValue;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 183, 19, 172),
                    foregroundColor: const Color.fromARGB(255, 192, 224, 193),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 242, 77, 171),
                  ),
                  onPressed: resetCalculator,
                  child: Text('Сброс', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 245, 17, 192),
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (op.isNotEmpty)
                    Text(
                      '$firstValue  $op $secondValue =',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  if (op.isNotEmpty)
                  SizedBox(height: 16,),
                  Text(
                    'Результат: $result',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

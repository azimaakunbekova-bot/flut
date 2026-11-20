import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProjectPage());
  }
}

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 28, 108),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Text('Виджеты компоновки'),
            Spacer(),
            Icon(Icons.search),
            SizedBox(width: 16),
            Icon(Icons.menu),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    color: const Color.fromARGB(255, 206, 54, 244),
                    child: Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    color: const Color.fromARGB(255, 223, 30, 194),
                    child: Center(
                      child: Text(
                        'B',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                Expanded(
                  flex: 3,
                  child: Container(
                    height: 120,
                    color: const Color.fromARGB(255, 126, 47, 105),
                    child: Center(
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(width: 30),
            //Flexible
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 120,
                    color: const Color.fromARGB(255, 206, 54, 244),
                    child: Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                Flexible(
                  flex: 2,
                  child: Container(
                    height: 120,
                    color: const Color.fromARGB(255, 223, 30, 194),
                    child: Center(
                      child: Text(
                        'B',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                Flexible(
                  flex: 3,
                  child: Container(
                    width: 300,
                    height: 120,
                    color: const Color.fromARGB(255, 126, 47, 105),
                    child: Center(
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            //Stuck
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color.fromARGB(255, 206, 54, 244),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: const Color.fromARGB(255, 30, 4, 24),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 160, 114, 162),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

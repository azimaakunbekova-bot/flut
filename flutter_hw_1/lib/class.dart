

import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 28, 201), // (Пункт 5 ДЗ: цвет фона экрана)
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 233, 28, 185), // (Пункт 4 ДЗ: цвет AppBar)
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/fonts/images/ham.jpeg'),
                backgroundColor: Color.fromARGB(255, 235, 173, 229),
                
              ),
              const SizedBox(height: 16),
              const Text(
                'Azima Akunbekova',
                style: TextStyle(
                  fontFamily: 'Sacramento-Regular.ttf', 
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 27, 11, 11), 
                ),
              ),
              const SizedBox(height: 8),
              
              const Text(
                'Age: 20',
                style: TextStyle(
                  fontFamily: 'Sacramento-Regular.ttf',
                  fontSize: 16,
                  color: Color.fromARGB(255, 48, 14, 54),
                ),
              ),
              const SizedBox(height: 8),
              
              const Text(
                'I\'m from Kyrgyzstan, Bishkek',
                style: TextStyle(
                  fontFamily: 'Sacramento-Regular.ttf',
                  fontSize: 16,
                  color: Color.fromARGB(255, 235, 235, 235),
                ),
              ),
              const SizedBox(height: 12),
              
              const Text(
                'Interests: study,reading,\nclay modeling, drawing, programming',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sacramento-Regular.ttf',
                  fontSize: 14,
                  color: Color.fromARGB(255, 235, 235, 235),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.alternate_email, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.videocam, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 235, 173, 229),
                  padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Follow', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


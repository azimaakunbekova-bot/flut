import 'package:flutter/material.dart';



class FeedBackApp extends StatelessWidget {
  const FeedBackApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lilacScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFB388EB), 
      brightness: Brightness.light,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Форма обратной связи',
      theme: ThemeData(
        colorScheme: lilacScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F5FF), // Очень светлый сиреневый фон
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF9575CD),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8E63CE), // Сиреневая кнопка
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          ),
        ),
      ),
      home: const FeedbackScreen(),
    );
  }
}


class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обратная связь'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            FeedbackHeader(
              title: 'Напишите нам',
              description: 'Введите ваше имя и нажмите кнопку отправки.',
            ),
            SizedBox(height: 20),
            
            FeedbackForm(),
          ],
        ),
      ),
    );
  }
}


class FeedbackHeader extends StatelessWidget {
  final String title;
  final String description;

  const FeedbackHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5E35B1), 
          ),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF6A5B7B), 
          ),
        ),
      ],
    );
  }
}

/// 2. Stateful-часть экрана
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _nameController = TextEditingController();

  String name = '';
  bool isSent = false;
  String? errorMessage;

  void _submitForm() {
    final trimmedName = _nameController.text.trim();

    setState(() {
      
      if (trimmedName.isEmpty) {
        isSent = false;
        errorMessage = 'Пожалуйста, введите ваше имя.';
        return;
      }

      name = trimmedName;
      isSent = true;
      errorMessage = null;

      
      _nameController.clear();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            labelStyle: const TextStyle(color: Color(0xFF6A4C93)),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1B3FF)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8E63CE), width: 2),
            ),
            errorText: errorMessage,
          ),
          onChanged: (value) {
            setState(() {
              name = value;
              if (errorMessage != null && value.trim().isNotEmpty) {
                errorMessage = null;
              }
            });
          },
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Отправить'),
          ),
        ),
        const SizedBox(height: 16),
        
        if (isSent)
          Text(
            'Отправлено! Спасибо, $name',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF7B3FE4), 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
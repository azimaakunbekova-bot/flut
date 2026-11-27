import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogListPage(),
    );
  }
}

class CatalogListPage extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    20,
    (i) => {
      'title': 'Товар ${i + 1}',
      'desc': 'Описание товара ${i + 1}',
      'image': 'https://picsum.photos/seed/item$i/200/140',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 183, 228),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Список товаров'),
        backgroundColor: const Color.fromARGB(137, 201, 115, 224),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPAge(
                      title: item['title']!,
                      desc: item['desc']!,
                      imageUrl: item['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPAge extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  ProductDetailPAge({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 183, 228),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: const Color.fromARGB(137, 201, 115, 224),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 12),

            Text(desc),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPage(productTitle: title),
                    ),
                  );
                },
                child: Text('Заказать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  final String productTitle;

  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 183, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(137, 201, 115, 224),
        title: Text('Заказ и оплата'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ваш заказ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Text(productTitle),

            SizedBox(height: 24),

            Text(
              'Способ оплаты',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Банковская карта'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Электронный кошелек'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Оплата прошла успешно!')),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderConfirmationPage(
                        productTitle:
                            productTitle, 
                      ),
                    ),
                  );
                },
                child: Text('Оплатить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  final String productTitle;

  const OrderConfirmationPage({super.key, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 183, 228),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 84),
              SizedBox(height: 20),
              Text(
                'Заказ успешно оформлен!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                productTitle,
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Вернуться в каталог'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

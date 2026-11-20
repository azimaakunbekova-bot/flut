import 'package:flutter/material.dart';
import 'constants.dart';

// ГЛАВНОЕ ПРИЛОЖЕНИЕ
class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 138, 234),

        appBar: AppBar(
          title: const Text('Товары'),
          backgroundColor: const Color.fromARGB(255, 102, 3, 74),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ПЕРВАЯ СТРОКА
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      image: 'images/e.jpg',
                      title: 'Nike Air Max',
                      price: '\$120',
                      category: 'Обувь',
                      rating: 5,
                      sale: true,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ProductCard(
                      image: 'images/p.jpeg',
                      title: 'Leather Bag',
                      price: '\$85',
                      category: 'Сумки',
                      rating: 4,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ВТОРАЯ СТРОКА
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      image: 'images/x.jpeg',
                      title: 'Headphones',
                      price: '\$210',
                      category: 'Техника',
                      rating: 5,
                      sale: true,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ProductCard(
                      image: 'images/m.jpeg',
                      title: 'Smart Watch',
                      price: '\$150',
                      category: 'Гаджеты',
                      rating: 4,
                    ),
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


// КАРТОЧКА ТОВАРА
class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool sale;
  final String category;
  final int rating;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    this.sale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(paddingSize),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 126, 212),
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: const Color.fromARGB(255, 202, 137, 215).withOpacity(0.05)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // КАРТИНКА И SALE
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageHeight,
                      color: const Color.fromARGB(255, 209, 49, 177),
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    );
                  },
                ),
              ),

              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'SALE',
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 56, 105),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 10),

          // НАЗВАНИЕ И ЦЕНА
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: priceColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // КАТЕГОРИЯ
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 128, 9, 239),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // РЕЙТИНГ
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating
                    ? Icons.star
                    : Icons.star_border,
                size: 16,
                color: Colors.amber,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // КНОПКА КУПИТЬ
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Купить',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 7),

          // КНОПКА ИЗБРАННОЕ
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('В избранное'),
            ),
          ),
        ],
      ),
    );
  }
}
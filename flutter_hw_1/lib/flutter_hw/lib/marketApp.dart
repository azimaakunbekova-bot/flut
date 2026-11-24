import 'package:flutter/material.dart';



class MarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F1FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9575CD),
          brightness: Brightness.light,
        ),
      ),
      home: MarketPage(),
    );
  }
}

class MarketPage extends StatefulWidget {
  @override
  State<MarketPage> createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  // 2. Исходные + 3 новые категории (минимум по 3 товара в каждой)
  final Map<String, List<String>> producrByCategory = {
    'Ноутбуки': ['Ноутбук Lenovo', 'Ноутбук Asus', 'Ноутбук HP'],
    'Смартфоны': ['iPhone 18', 'Samsung Galaxy', 'Xiaomi Redmi'],
    'Аксессуары': ['Наушники', 'Клавиатура', 'Мышь'],
    'Мониторы': ['Монитор LG 27"', 'Монитор Samsung Odyssey', 'Монитор Dell'],
    'Принтеры': ['Принтер HP LaserJet', 'Принтер Canon PIXMA', 'Принтер Epson'],
    'Игровые устройства': ['PlayStation 5', 'Steam Deck', 'Геймпад DualSense'],
  };

  // 4. Дополнительная информация о цене для каждого товара
  final Map<String, String> productPrices = {
    'Ноутбук Lenovo': '65 000 сом',
    'Ноутбук Asus': '74 000 сом',
    'Ноутбук HP': '59 000 сом',
    'iPhone 18': '95 000 сом',
    'Samsung Galaxy': '68 000 сом',
    'Xiaomi Redmi': '24 000 сом',
    'Наушники': '7 500 сом',
    'Клавиатура': '5 200 сом',
    'Мышь': '3 100 сом',
    'Монитор LG 27"': '29 500 сом',
    'Монитор Samsung Odyssey': '34 000 сом',
    'Монитор Dell': '21 000 сом',
    'Принтер HP LaserJet': '18 500 сом',
    'Принтер Canon PIXMA': '12 900 сом',
    'Принтер Epson': '23 400 сом',
    'PlayStation 5': '56 000 сом',
    'Steam Deck': '62 000 сом',
    'Геймпад DualSense': '8 200 сом',
  };

  Set<String> favorites = {};

  // 0 - Каталог, 1 - Сетка (GridView), 2 - Избранное, 3 - Профиль
  int currentIndex = 0;

  String getProductCategory(String product) {
    for (final entry in producrByCategory.entries) {
      if (entry.value.contains(product)) {
        return entry.key;
      }
    }
    return '';
  }

  // 3. Уникальная иконка в зависимости от категории
  IconData getCategoryIcon(String product) {
    switch (getProductCategory(product)) {
      case 'Ноутбуки':
        return Icons.laptop;
      case 'Смартфоны':
        return Icons.smartphone;
      case 'Аксессуары':
        return Icons.headphones;
      case 'Мониторы':
        return Icons.monitor;
      case 'Принтеры':
        return Icons.print;
      case 'Игровые устройства':
        return Icons.sports_esports;
      default:
        return Icons.shopping_bag;
    }
  }

  // 3. Изменённый цвет иконки в зависимости от категории (в сиренево-фиолетовой гамме)
  Color getCategoryColor(String product) {
    switch (getProductCategory(product)) {
      case 'Ноутбуки':
        return const Color(0xFF6A4C93);
      case 'Смартфоны':
        return const Color(0xFF8E63CE);
      case 'Аксессуары':
        return const Color(0xFF9C51B6);
      case 'Мониторы':
        return const Color(0xFF5E548E);
      case 'Принтеры':
        return const Color(0xFF7B5EA7);
      case 'Игровые устройства':
        return const Color(0xFF9F67E8);
      default:
        return const Color(0xFF8A79AF);
    }
  }

  void toggleFavorite(String product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  // 1. Сетка карточек GridView
  Widget buildGridCatalog() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 195, 165, 231),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFDCC9F7)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x227E57C2),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Icon(
                  Icons.shopping_bag,
                  size: 60,
                  color: Color(0xFF7E57C2),
                ),
              ),
              Text(
                'Товар ${index + 1}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3E2763),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget buildProductList(List<String> products) {
    if (products.isEmpty) {
      return const Center(
        child: Text(
          'Список пуст',
          style: TextStyle(fontSize: 16, color: Color(0xFF5E487E)),
        ),
      );
    }

    // 5. Заменили ListView.builder на ListView.separated
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: products.length,
      itemBuilder: (context, index) {
        String product = products[index];
        bool isFavorite = favorites.contains(product);
        String price = productPrices[product] ?? 'Цена не указана';

        // 3. Добавили отступы между элементами списка
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFAF6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                getCategoryIcon(product),
                color: getCategoryColor(product),
                size: 30,
              ),
              // 3. Размер названия товара 16 пикселей
              title: Text(
                product,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF362157),
                ),
              ),
              // 4. Информация о цене
              subtitle: Text(
                'Цена: $price • Товар есть в наличии',
                style: const TextStyle(color: Color(0xFF6A558A)),
              ),
              trailing: IconButton(
                onPressed: () {
                  toggleFavorite(product);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? const Color(0xFF9C27B0)
                      : const Color(0xFF9E8BB8),
                ),
              ),
            ),
          ),
        );
      },
      // 5. Разделитель между товарами
      separatorBuilder: (context, index) {
        return const Divider(color: Color(0xFFDAD0EB), height: 1);
      },
    );
  }

  String getAppBarTitle() {
    switch (currentIndex) {
      case 0:
        return 'Каталог товаров';
      case 1:
        return 'GridView';
      case 2:
        return 'Избранное';
      default:
        return 'Профиль';
    }
  }

  Widget buildBody() {
    switch (currentIndex) {
      case 0:
        return TabBarView(
          children: [
            buildProductList(producrByCategory['Ноутбуки']!),
            buildProductList(producrByCategory['Смартфоны']!),
            buildProductList(producrByCategory['Аксессуары']!),
            buildProductList(producrByCategory['Мониторы']!),
            buildProductList(producrByCategory['Принтеры']!),
            buildProductList(producrByCategory['Игровые устройства']!),
            buildProductList(
              producrByCategory.values
                  .expand((products) => products)
                  .toList(),
            ),
          ],
        );
      case 1:
        return buildGridCatalog();
      case 2:
        return buildProductList(favorites.toList());
      default:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 64, color: Color(0xFF8E63CE)),
              SizedBox(height: 16),
              Text(
                'Профиль пользователя',
                style: TextStyle(fontSize: 24, color: Color(0xFF3E2763)),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFE6D6FA),
          foregroundColor: const Color(0xFF362157),
          title: Text(getAppBarTitle()),
          bottom: currentIndex == 0
              ? const TabBar(
                  isScrollable: true,
                  labelColor: Color(0xFF4A2C7A),
                  unselectedLabelColor: Color(0xFF7D699C),
                  indicatorColor: Color(0xFF7E57C2),
                  indicatorWeight: 2.5,
                  tabs: [
                    Tab(text: 'Ноутбуки'),
                    Tab(text: 'Смартфоны'),
                    Tab(text: 'Аксессуары'),
                    Tab(text: 'Мониторы'),
                    Tab(text: 'Принтеры'),
                    Tab(text: 'Игровые устройства'),
                    Tab(text: 'Все товары'),
                  ],
                )
              : null,
        ),
        body: buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xFF5E35B1),
          unselectedItemColor: const Color(0xFF8A75A8),
          backgroundColor: const Color(0xFFEDE2FC),
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Сетка',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
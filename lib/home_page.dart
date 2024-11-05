import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Panda',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Pizza', 'icon': Icons.local_pizza},
    {'title': 'Burger', 'icon': Icons.fastfood},
    {'title': 'Juice', 'icon': Icons.local_drink},
    {'title': 'Fried Rice', 'icon': Icons.rice_bowl},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: const Center(child: Text("Food Panda")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Adding the image right after the AppBar
          Image.asset(
            'assets/images/img.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'foodpanda',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
          const Text(
            'Are you hungry? Order Now . . .',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'SET MENU',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2,
                mainAxisSpacing: 3,
              ),
              padding: const EdgeInsets.all(20),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return _buildMenuContainer(
                  title: menuItems[index]['title'],
                  icon: menuItems[index]['icon'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuContainer({required String title, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        // Handle the tap action
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected $title')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
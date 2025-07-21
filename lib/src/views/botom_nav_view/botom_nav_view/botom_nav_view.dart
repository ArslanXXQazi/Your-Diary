import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../botom_nav_controller/botom_nav_controller.dart';

class BotomNavView extends StatelessWidget {
  const BotomNavView({super.key});

  final List<Widget> _pages = const [
    Center(child: Text('Tab 1')),
    Center(child: Text('Tab 2')),
    Center(child: Text('Tab 3')),
    Center(child: Text('Tab 4')),
  ];

  @override
  Widget build(BuildContext context) {
    final BotomNavController controller = Get.put(BotomNavController());
    return Scaffold(
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Alerts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}


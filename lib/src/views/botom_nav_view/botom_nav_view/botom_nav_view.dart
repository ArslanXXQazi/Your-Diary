import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/views/botom_nav_view/diary_view/diary_view.dart';
import 'package:yourdiary/src/views/botom_nav_view/message_nav_view/chat_screen.dart';
import 'package:yourdiary/src/views/botom_nav_view/settings_nav_view/settings_nav_view.dart';
import '../../../controller/constant/app_images/app_images.dart';
import '../botom_nav_controller/botom_nav_controller.dart';

class BotomNavView extends StatelessWidget {
  const BotomNavView({super.key});

  final List<Widget> _pages = const [
    DiaryView(),
    ChatScreen(),
    SettingsNavView(),
    //Center(child: Text('Tab 4')),
  ];

  @override
  Widget build(BuildContext context) {
    final BotomNavController controller = Get.put(BotomNavController());
    return Scaffold(
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.diary)),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.chat)),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.settings)),
              label: 'Settings',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ],
        ),
      ),
    );
  }
}

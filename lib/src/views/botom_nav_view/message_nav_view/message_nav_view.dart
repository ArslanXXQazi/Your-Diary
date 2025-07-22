import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';

class MessageNavView extends StatelessWidget {
  MessageNavView({super.key}); // Removed const from constructor

  // List of announcements without const
  final List<Map<String, dynamic>> announcements = [
    {
      'title': 'School Announcement',
      'message': 'Please note the upcoming holidays...',
      'time': '2h ago',
      'onTap': () => print('Tapped on School Announcement'),
    },
    {
      'title': 'Math Homework',
      'message': 'A new homework assignment has been...',
      'time': '1d ago',
      'onTap': () => print('Tapped on Math Homework'),
    },
    {
      'title': 'Homework Reminder',
      'message': 'Reminder to complete your homework',
      'time': '3h ago',
      'onTap': () => print('Tapped on Homework Reminder'),
    },
    {
      'title': 'Profile Updated',
      'message': 'Your profile information has been changed',
      'time': '3h ago',
      'onTap': () => print('Tapped on Profile Updated'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              height: screenHeight * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenHeight * 0.02,
                  right: screenHeight * 0.02,
                  top: screenHeight * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    BlackText(
                      text: "Inbox",
                      fontSize: 18,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    ImageIcon(
                       AssetImage(AppImages.settings),
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.02,
              ),
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final announcement = announcements[index];
                return GestureDetector(
                  onTap: announcement['onTap'],
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.08,
                              backgroundColor: AppColor.blue,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlackText(
                                    text: announcement['title'],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  BlackText(
                                    text: announcement['message'],
                                    textColor: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.start,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            BlackText(
                              text: announcement['time'],
                              textColor: Colors.grey,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        if (index != announcements.length - 1) const Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
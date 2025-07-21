import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yourdiary/src/controller/common_widgets/text_feild_widget.dart';
import 'package:yourdiary/src/controller/common_widgets/text_widget.dart';
import 'package:yourdiary/src/controller/constant/app_colors/app_color.dart';
import 'package:yourdiary/src/controller/constant/app_images/app_images.dart';
import 'package:yourdiary/src/routes/app_routes.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    TextEditingController searchController = TextEditingController();

    // List of subjects
    final List<Map<String, dynamic>> subjects = [
      {
        'name': 'Math',
        'task': 'Task 4',
        'imagePath': AppImages.image1,
        'progress': 1.0, // Set to 100%
        'onTap': () {
         Get.toNamed(AppRoutes.subjectDetailView);
        },
      },
      {
        'name': 'Science',
        'task': 'Task 2',
        'imagePath': AppImages.image1,
        'progress': 0.19,
        'onTap': () {
          print('Science tapped');
        },
      },
      {
        'name': 'English',
        'task': 'Task 3',
        'imagePath': AppImages.image1,
        'progress': 0.75,
        'onTap': () {
          print('English tapped');
        },
      },
      {
        'name': 'Music',
        'task': 'Task 3',
        'imagePath': AppImages.image1,
        'progress': 1.0,
        'onTap': () {
          print('Music tapped');
        },
      },
      {
        'name': 'Chemistry',
        'task': 'Task 3',
        'imagePath': AppImages.image1,
        'progress': 0.1,
        'onTap': () {
          print('Music tapped');
        },
      },

    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              color: AppColor.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackText(
                              text: "Hello",
                              textColor: Colors.white,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            BlackText(
                              text: "Victoria",
                              textColor: Colors.white,
                              fontSize: 25,
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: screenHeight * 0.08,
                            width: screenWidth * 0.18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*.02),
              child: TextFieldWidget(
                  controller: searchController,
                  hintText: "Search for anything",
                  fillColor: Colors.white,
                  hintColor: Colors.grey,
                  prefixIcon: Icon(Icons.search,color: AppColor.blue,size: screenWidth*.08,),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlackText(
                        text: "Home Work",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      BlackText(
                        onTap: () {
                          print("See all subjects tapped");
                        },
                        text: "See all subjects",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.blue,
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true, // Ensures GridView takes only required space
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: screenHeight * 0.015, bottom: screenHeight * 0.03),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 containers per row
                      crossAxisSpacing: screenWidth * 0.03, // Spacing between containers
                      mainAxisSpacing: screenHeight * 0.02,
                      childAspectRatio: (screenWidth * 0.45) / (screenHeight * 0.27),
                    ),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GestureDetector(
                          onTap: subject['onTap'],
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BlackText(
                                          text: subject['name'],
                                          fontWeight: FontWeight.w600,
                                        ),
                                        BlackText(
                                          text: subject['task'],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.05,
                                          width: screenWidth * 0.11,
                                          child: CircularProgressIndicator(
                                            value: subject['progress'],
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                            backgroundColor: Colors.grey[200],
                                            strokeWidth: screenWidth * 0.012,
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Center(
                                            child: subject['progress'] == 1.0
                                                ? Icon(
                                              Icons.check_circle_rounded,
                                              size: screenWidth * 0.1,
                                              color: AppColor.blue,
                                            )
                                                : BlackText(
                                              text: "${(subject['progress'] * 100).toInt()}%",
                                              fontSize: 12,
                                              textColor: AppColor.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Image(
                                      image: AssetImage(subject['imagePath']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/modules/profile/profile_controller/profile_controller.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/common_widget.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: myHeadingText(text: "Profile"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: myBackButton(),
      ),
      body: Column(
        children: [
          // --- Header Profile Info
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          //   decoration: BoxDecoration(
          //     // color: Theme.of(context).cardColor,
          //     borderRadius: BorderRadius.circular(0),
          //   ),
          //   child: Row(
          //     children: [
          //       CircleAvatar(
          //         radius: 35,
          //         backgroundColor: Colors.blue.shade100,
          //         child: Icon(Icons.person, size: 40, color: MyColors.black),
          //       ),
          //       SizedBox(width: 16),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Sadique Khan",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             SizedBox(height: 4),
          //             Text(
          //               "Available Amount: ₹36,500",
          //               style: TextStyle(color: Colors.grey.shade700),
          //             ),
          //           ],
          //         ),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           EasyLoading.showToast("Pending Work");
          //         },
          //         icon: Icon(
          //           Icons.edit,
          //           color: Theme.of(context).iconTheme.color,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // SizedBox(height: 20),

          // --- Account Details Section
          Card(
            // margin: EdgeInsets.symmetric(vertical: 25),
            color: Theme.of(context).cardColor,
            elevation: 1,
            shadowColor: Theme.of(context).shadowColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: MyColors.black,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sadique Khan",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Available Amount: ₹36,500",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            EasyLoading.showToast("Pending Work");
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Phone"),
                    subtitle: Text("+91-8726403478"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Email"),
                    subtitle: Text("sadique@example.com"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Location"),
                    subtitle: Text("Mumbai, India"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text("Refer and Earn"),
                    subtitle: Text("Invite friends and get cash rewards"),
                  ),

                  // Divider(height: 1),
                  // ListTile(
                  //   leading: Icon(Icons.lock),
                  //   title: Text("Change Password"),
                  //   onTap: () {},
                  // ),
                  // Divider(height: 2, color: Colors.red),
                  // ListTile(
                  //   leading: Icon(Icons.logout, color: Colors.red),
                  //   title: Text(
                  //     "Logout",
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  //   onTap: () {
                  //     // Logout logic
                  //   },
                  // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(height: 20),

                  // // --- Settings / Actions Section
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Card(
                  //     color: Theme.of(context).cardColor,
                  //     elevation: 2,
                  //     shadowColor: Theme.of(context).shadowColor,

                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Column(
                  //       children: [
                  Divider(height: 1),

                  ListTile(
                    leading: Icon(
                      controller.mythemecontroller.isDarkMode.value
                          ? CupertinoIcons.moon
                          : Icons.sunny,
                      size: 20,
                    ),
                    title: Text(
                      controller.mythemecontroller.isDarkMode.value
                          ? 'Dark Mode'
                          : "Light Mode",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: Text('Theme'.tr, style: TextStyle(fontSize: 12)),
                    trailing: Obx(() {
                      return CupertinoSwitch(
                        activeTrackColor: Theme.of(context).primaryColor,
                        inactiveTrackColor: Colors.blueAccent.shade100,
                        thumbColor: Colors.white70,
                        value: controller.mythemecontroller.isDarkMode.value,
                        onChanged: (value) {
                          controller.mythemecontroller.toggleTheme();
                        },
                      );
                    }),
                  ),
                  Divider(height: 1),

                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Change Password"),
                    onTap: () {
                      controller.getUserDetails();
                    },
                  ),
                  Divider(height: 2, color: Colors.red),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text("Logout", style: TextStyle(color: Colors.red)),
                    onTap: () async {
                      // Logout logic
                      await controller.prefs.clear();
                      // await Future.delayed(Duration(milliseconds: 200));
                      Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
                    },
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text("Version 0.0.01"),
          ),
          // SizedBox(height: 25),
        ],
      ),
    );
  }
}

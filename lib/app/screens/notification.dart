import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model/notification.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  static const url = '/notification';
  @override
  var notifications = [
    Notifications(
      name: "Admin",
      message:
          "Bonsoir Junior Tasse Voici la liste des result bien vouloir considerer que vous etre le numero 32",
      profileImage: "assets/images/Avatar-4.png",
      date: '02:45 AM',
      status: true,
    ),
    Notifications(
      name: "Admin",
      message:
          "Hey Bonsoir a tous. Voici la liste des taches de la rencontre de Samedi",
      profileImage: "assets/images/Avatar-9.png",
      date: 'yesterday',
      status: true,
    ),
    Notifications(
      name: "Admin",
      message: "Hey Junior voici le programme de l'eglise",
      profileImage: "assets/images/Avatar-10.png",
      date: '2 days',
      status: true,
    ),
    Notifications(
      name: "Admin",
      message:
          "Hey Bonsoir a tous. S'il vous plait n'oublier pas notre rencontre aujourd'hui a 17hr",
      profileImage: "assets/images/Avatar-21.png",
      date: '08:30 AM',
      status: true,
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Messages",
              //       style: TextStyle(
              //         fontSize: 20,
              //       ),
              //     ),
              //     IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           CupertinoIcons.cloud,
              //         ))
              //     // Text(
              //     //   "☁",
              //     //   style: TextStyle(fontSize: 20),
              //     // )
              //   ],
              // ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Notification",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "search",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 22.sp,
                      )),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              ...notifications
                  .map(
                    (e) => NotificationItem(
                        name: e.name,
                        message: e.message,
                        profileImage: e.profileImage,
                        date: e.date,
                        status: e.status),
                  )
                  .toList()
            ],
          ),
        )),
      ),
    );
  }
}

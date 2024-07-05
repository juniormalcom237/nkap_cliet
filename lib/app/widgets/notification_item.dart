import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.name,
    required this.message,
    required this.profileImage,
    required this.date,
    required this.status,
  }) : super(key: key);
  final String name;
  final String message;
  final String profileImage;
  final String date;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.yellow,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            name,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          message,
                          style: TextStyle(
                            color: status ? Colors.grey : Colors.white,
                            fontSize: 16.sp,
                          ),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Text(
                date,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider()
        ],
      ),
    );
  }
}

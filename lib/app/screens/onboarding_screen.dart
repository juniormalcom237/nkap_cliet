import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'authentication.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 80.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Welcome To Inkap",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          height: 35.h,
                          width: 100.w,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: Image.asset(
                              "assets/images/splash.png",
                              fit: BoxFit.contain,
                              width: 100.w,
                            ),
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Steady progress,",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: Text(
                              "without a mess",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: 90.w,
                            child: Text(
                              "Hey! A single place for your team to communicate, act on task, track progress and deliver goal with no stress",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  height: 1.5),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(HomeScreen.url);
                  // context.go('/auth');
                  Get.offAll(Authentication_screen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6D67E4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: SizedBox(
                  height: 7.h,
                  width: 95.w,
                  child: Center(
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

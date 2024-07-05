import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nkap/api/api_controller.dart';
import 'package:nkap/app/screens/Setting.dart';
import 'package:nkap/app/screens/notification.dart';
import 'package:nkap/app/screens/transaction.dart' as W;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/transactionTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  List<Widget> _screenList = [
    HomeScreenPage(),
    W.Transaction(),
    NotificationScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.arrow_up_arrow_down),
            label: 'Transaction',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: _screenList[currentPageIndex],
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  MyController c = Get.find();

  // Future<List<Transaction>?>? transaction;
  final transactions = [
    TransactionListTile(type: "collect", amount: "20000"),
    TransactionListTile(type: "collect", amount: "50000"),
    TransactionListTile(type: "collect", amount: "60000"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    // transaction = c.getTransaction(c.localDB.read("userData")['id']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("InKap"),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            tooltip: 'Scan Qrcode',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'notification cx',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "👋🏾 ${c.localDB.read("userData")["name"]}",
                    style: TextStyle(fontSize: 18.sp),
                  )),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF0D1282),
                    borderRadius: BorderRadius.circular(10.sp)),
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                width: 100.w,
                height: 19.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Last transaction",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "1000frs CFA",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 1.8.h,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "View Listing",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionListTile(
                      type: transactions[index].type,
                      date: "",
                      amount: transactions[index].amount);
                },
                shrinkWrap: true,
                itemCount: transactions.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget placeholderWhileTransactionBuild() => Center(
      child: SizedBox(
        height: 26.sp,
        width: 26.sp,
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
Padding errorBusiness(Object? error) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.portable_wifi_off_outlined,
          size: 56.sp,
        ),
        SizedBox(height: 2.h),
        Text("$error",
            style: TextStyle(
                fontFamily: 'Lexend',
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        // Obx(
        //   () => MaterialButton(
        //       minWidth: 60.w,
        //       padding: EdgeInsets.symmetric(vertical: 1.5.h),
        //       color: Theme.of(Get.context!).colorScheme.primary,
        //       splashColor: Colors.transparent,
        //       focusColor: Colors.transparent,
        //       hoverColor: Colors.transparent,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.horizontal(
        //               left: Radius.circular(15.sp),
        //               right: Radius.circular(15.sp))),
        //       onPressed: () {},
        //       // onPressed: !c.isLoading.value
        //       //     ? () {
        //       //   setState(() {
        //       //     allTransaction = c.getTransaction(widget.businessId);
        //       //   });
        //       // }
        //       //     : null,
        //       child: Text("showPartnersNoInternetButton".tr,
        //           style: TextStyle(
        //               fontFamily: 'Lexend',
        //               fontSize: 16.sp,
        //               fontWeight: FontWeight.w500))),
        // ),
      ],
    ),
  );
}

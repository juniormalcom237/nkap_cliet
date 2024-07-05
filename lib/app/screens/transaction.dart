import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../api/api_controller.dart';
import '../widgets/transactionTile.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController controller = TextEditingController();
  @override
  MyController c = Get.find();

  // Future<List<W.Transaction>?>? transaction;
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Transactions",
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
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
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                // FutureBuilder<List<W.Transaction>?>(
                //   future: transaction,
                //   builder: (context, snapshot) {
                //     switch (snapshot.connectionState) {
                //       case ConnectionState.waiting:
                //         return Container(
                //             height: 80.h,
                //             child: Center(
                //                 child: placeholderWhileTransactionBuild()));
                //       case ConnectionState.done:
                //       default:
                //         if (snapshot.hasError) {
                //           return Container(
                //               height: 80.h,
                //               child:
                //                   Center(child: errorBusiness(snapshot.error)));
                //         } else if (snapshot.hasData) {
                //           if (snapshot.data!.isEmpty) {
                //             return Container(
                //               height: 85.h,
                //               child: Center(
                //                 child: Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: [
                //                     Expanded(
                //                       child: Column(
                //                         children: [
                //                           SizedBox(
                //                             height: 25.h,
                //                           ),
                //                           SizedBox(
                //                             // width: 70.w,
                //                             child: Text(
                //                               "No Assign Collector".tr,
                //                               style: TextStyle(
                //                                   fontFamily: 'Lexend',
                //                                   fontSize: 18.sp,
                //                                   color: Colors.white54,
                //                                   fontWeight: FontWeight.w400),
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             height: 1.h,
                //                           ),
                //                           // SizedBox(
                //                           //   width: 80.w,
                //                           //   child: Text(
                //                           //     "historyDescriptionlabel".tr,
                //                           //     softWrap: true,
                //                           //     textAlign: TextAlign.center,
                //                           //     style: TextStyle(
                //                           //         fontFamily: 'Lexend',
                //                           //         fontSize: 16.sp,
                //                           //         color: Colors.white38,
                //                           //         fontWeight: FontWeight.w200),
                //                           //   ),
                //                           // ),
                //                           // SizedBox(
                //                           //   height: 10.h,
                //                           // ),
                //                         ],
                //                       ),
                //                     ),
                //                     // MaterialButton(
                //                     //     minWidth: 70.w,
                //                     //     padding: EdgeInsets.symmetric(
                //                     //         vertical: 2.h, horizontal: 20.w),
                //                     //     color: Theme.of(context)
                //                     //         .colorScheme
                //                     //         .primary,
                //                     //     splashColor: Colors.transparent,
                //                     //     focusColor: Colors.transparent,
                //                     //     hoverColor: Colors.transparent,
                //                     //     shape: RoundedRectangleBorder(
                //                     //         borderRadius:
                //                     //             BorderRadius.horizontal(
                //                     //                 left:
                //                     //                     Radius.circular(15.sp),
                //                     //                 right: Radius.circular(
                //                     //                     15.sp))),
                //                     //     onPressed: () {
                //                     //       // setState(() {
                //                     //       //   allTransaction = c.getTransaction(
                //                     //       //       widget.businessId);
                //                     //       // });
                //                     //     },
                //                     //     child: Text(
                //                     //       "historyErrorReload".tr,
                //                     //       style: TextStyle(
                //                     //           fontFamily: 'Lexend',
                //                     //           fontSize: 16.sp,
                //                     //           color: Colors.white70,
                //                     //           fontWeight: FontWeight.w500),
                //                     //     )),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           } else {
                //             return;
                //           }
                //         } else {
                //           return placeholderWhileTransactionBuild();
                //         }
                //     }
                //   },
                // ),

                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return TransactionListTile(
                      type: transactions[index].type!,
                      date: "",
                      amount: transactions[index].amount,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: transactions.length,
                )
              ],
            ),
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

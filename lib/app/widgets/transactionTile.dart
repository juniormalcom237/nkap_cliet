import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    Key? key,
    required this.type,
    required this.amount,
    this.date,
  }) : super(key: key);
  final String type;
  final String amount;
  final date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            child: Icon(Icons.arrow_downward_sharp),
          ),
          title: Text(
            type,
            style: TextStyle(fontSize: 17.sp),
          ),
          subtitle: Text(
            "$amount FCFA",
            style: TextStyle(
                fontSize: 17.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            "22 Jul. 04:35",
            style: TextStyle(color: Colors.black45, fontSize: 16.sp),
          ),
        ),
        Divider()
      ],
    );
  }
}

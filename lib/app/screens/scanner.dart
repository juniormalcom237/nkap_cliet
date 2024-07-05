// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../api/api_controller.dart';
// import '../widgets/process_indicator.dart';
//
// class QrScanPage extends StatefulWidget {
//   const QrScanPage({Key? key, required this.businessId}) : super(key: key);
//
//   final String businessId;
//
//   @override
//   State<QrScanPage> createState() => _QrScanPageState();
// }
//
// class _QrScanPageState extends State<QrScanPage> {
//   Barcode? result;
//   QRViewController? controller;
//   final MyController c = Get.find();
//   late bool showprogress;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//   @override
//   void initState() {
//     super.initState();
//     showprogress = false;
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() => {this.controller = controller, controller.resumeCamera()});
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   void readQr() async {
//     if (result != null) {
//       String? code = result!.code;
//       if (kDebugMode) {
//         print("AGENT CODE -> $code");
//       }
//
//       controller!.pauseCamera();
//       controller!.dispose();
//       c.scan(code!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     readQr();
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           clipBehavior: Clip.none,
//           fit: StackFit.passthrough,
//           alignment: Alignment.center,
//           children: [
//             buildQrView(),
//             Positioned(
//                 top: 5,
//                 left: 15.sp,
//                 child: IconButton(
//                     icon: const Icon(CupertinoIcons.chevron_back),
//                     onPressed: () {
//                       Get.back();
//                     })),
//             Positioned(
//               top: 10.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("scannerLabel".tr,
//                       style: TextStyle(
//                           fontFamily: 'Lexend',
//                           color: Colors.white,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w700)),
//                   SizedBox(height: 1.h),
//                   Text("scannerDescription".tr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Lexend',
//                         color: Colors.white70,
//                         fontSize: 16.sp,
//                       )),
//                 ],
//               ),
//             ),
//             Positioned(bottom: 12.h, child: buildControlButtons()),
//             Positioned(bottom: 10, child: buildResult()),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildQrView() {
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.white,
//         borderRadius: 4.sp,
//         borderLength: 20.sp,
//         borderWidth: 10.sp,
//         cutOutSize: 80.w,
//       ),
//     );
//   }
//
//   Widget buildControlButtons() {
//     return Container(
//       height: 32.sp,
//       width: 32.sp,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//       ),
//       child: GestureDetector(
//         onTap: () async {
//           await controller?.toggleFlash();
//           setState(() {});
//         },
//         child: FutureBuilder<bool?>(
//           future: controller?.getFlashStatus(),
//           builder: (context, snapshot) {
//             if (snapshot.data != null) {
//               return snapshot.data!
//                   ? Image.asset(
//                       'assets/img/lamp.png',
//                       color: Colors.white.withOpacity(0.6),
//                       colorBlendMode: BlendMode.modulate,
//                     )
//                   : Image.asset(
//                       'assets/img/lamp.png',
//                       color: Colors.white.withOpacity(0.36),
//                       colorBlendMode: BlendMode.modulate,
//                     );
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget buildResult() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.w),
//       color: Colors.transparent,
//       child: showprogress
//           ? const MyProgressIndicator()
//           : Text(
//               result != null ? "role: ${describeEnum(result!.format)}" : "",
//               style: TextStyle(fontFamily: 'Lexend', fontSize: 16.sp),
//             ),
//     );
//   }
// }

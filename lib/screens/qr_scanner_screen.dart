import 'package:flutter/material.dart';
import 'package:gym_graduation_app/helper/api.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import 'dart:io' show Platform;

import 'trainee_profile_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});
  static String id = 'QR Scanner Screen';

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool scannedQr = false;
  bool isFound = false;
  bool isSubValid = false;
  String? role;
  DateTime? endDate;
  TraineeModel? scannedTrainee;
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    scannedQr = true;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) async {
      isFound = false;
      isSubValid = false;
      endDate = null;
      role = null;
      result = scanData;
      scannedTrainee = null;
      controller.pauseCamera();
      //ToDo
      final response = await Api.getUser(userId: scanData.code);

      if (response["status"] == "success") {
        isFound = true;
        role = response["user"]["role"];
        if (response["subscribe"] != null) {
          endDate = DateTime.parse(response["subscribe"]["endDate"]);
          if (DateTime.now().isBefore(endDate!)) isSubValid = true;
        }

        scannedTrainee = TraineeModel.fromMap(response);
      }
      showResultDialog(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: kPrimaryColor,
                borderWidth: 10,
                borderLength: 10,
                borderRadius: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: kBackgroundColor,
          title: const Center(
            child: Text("Result", style: TextStyle(color: Colors.white)),
          ),
          children: [
            if (isFound && isSubValid) ...[
              const SizedBox(
                height: 15,
              ),
              const Icon(
                FontAwesomeIcons.circleCheck,
                color: Colors.green,
              ),
              const SizedBox(
                height: 15,
              ),
              Text("User is found!", textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Text("Subscription will Expire on ${endDate!.year}-${endDate!.month}-${endDate!.day}",
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        controller!.resumeCamera();
                        Navigator.pop(context);
                      },
                      child: const Text("Scan Again", style: TextStyle(color: Colors.white, fontSize: 14))),
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        controller!.resumeCamera();
                        isFound = false;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return TraineeProfileScreen(trainee: scannedTrainee!);
                        }));
                      },
                      child: const Text("Go to Profile", style: TextStyle(color: Colors.white, fontSize: 14)))
                ],
              )
            ] else if (isFound && !isSubValid) ...[
              const SizedBox(
                height: 15,
              ),
              const Icon(
                FontAwesomeIcons.circleXmark,
                color: Colors.red,
              ),
              const SizedBox(
                height: 15,
              ),
              Text("User is Found\nBut Expired or not Subscribed! ", textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              role == "trainee"
                  ? Text("Expired on ${endDate!.year}-${endDate!.month}-${endDate!.day}", textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold))
                  : const SizedBox(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        controller!.resumeCamera();
                        Navigator.pop(context);
                      },
                      child: const Text("Scan Again", style: TextStyle(color: Colors.white, fontSize: 14))),
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        controller!.resumeCamera();
                        isFound = false;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return TraineeProfileScreen(trainee: scannedTrainee!);
                        }));
                      },
                      child: const Text("Go to Profile", style: TextStyle(color: Colors.white, fontSize: 14)))
                ],
              )
            ] else ...[
              const SizedBox(
                height: 15,
              ),
              const Icon(
                FontAwesomeIcons.circleXmark,
                color: Colors.red,
              ),
              const SizedBox(
                height: 15,
              ),
              Text("User is not found!", textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        controller!.resumeCamera();
                        Navigator.pop(context);
                      },
                      child: const Text("Scan Again", style: TextStyle(color: Colors.white, fontSize: 14))),
                ],
              )
            ]
          ]),
    );
  }
}

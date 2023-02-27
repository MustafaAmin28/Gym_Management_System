import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../models/trainee_model.dart';
import '../services/users.dart';
import 'dart:io' show Platform;

import 'profile_screen.dart';

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
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        isFound = false;
        result = scanData;
        scannedTrainee = null;
        controller.pauseCamera();
        for (int i = 0; i < Users.length; i++) {
          if (scanData.code == Users[i]['id'].toString()) {
            isFound = true;
            scannedTrainee = TraineeModel.fromMap(Users[i]);
          }
        }
        showResultDialog(context);
      });
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: kBackgroundColor,
          title: const Center(
            child: Text("Result", style: TextStyle(color: Colors.white)),
          ),
          children: isFound == true
              ? [
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
                  const Align(
                    child: Text("User is found ",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
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
                          child: const Text("Scan Again",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                          ),
                          onPressed: () {
                            controller!.resumeCamera();
                            isFound = false;
                            Navigator.pop(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProfileScreen(person: scannedTrainee!);
                            }));
                          },
                          child: const Text("Go to Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)))
                    ],
                  )
                ]
              : [
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
                  const Align(
                    child: Text("User is not found ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
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
                          child: const Text("Scan Again",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                    ],
                  )
                ]),
    );
  }
}

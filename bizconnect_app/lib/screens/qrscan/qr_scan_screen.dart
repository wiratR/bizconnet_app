import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class QrScanScreen extends StatefulWidget {
  @override
  _QrScanScreenState createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  String qrCodeResult = "Not Yet Scanned";

  @override
  void initState() {
    super.initState();
    _scanQRCode();
  }

  Future<void> _scanQRCode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        qrCodeResult = result.rawContent;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          qrCodeResult = "Camera permission was denied";
        });
      } else {
        setState(() {
          qrCodeResult = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        qrCodeResult = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        qrCodeResult = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              qrCodeResult,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQRCode,
              child: Text("Open Scanner"),
            ),
          ],
        ),
      ),
    );
  }
}

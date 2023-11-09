import 'package:autom/pages/qr_result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  QRViewController? _qrViewController;
  GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  String? scannedResult = ""; // Variable to store the scanned QR code result

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: QRView(
        key: _qrKey,
        onQRViewCreated: (controller) {
          setState(() {
            _qrViewController = controller;
            _qrViewController!.scannedDataStream.listen((scanData) {
              _onQRCodeScanned(scanData.code);
            });
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  void _onQRCodeScanned(String? qrCode) {
    setState(() {
      scannedResult = qrCode;
    });

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return QRResultDialog(scannedResult: scannedResult);
      },
    );
  }
}

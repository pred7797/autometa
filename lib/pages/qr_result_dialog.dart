import 'package:flutter/material.dart';

class QRResultDialog extends StatelessWidget {
  final String? scannedResult;
  final name = '16103 | PRERAK DARJI';

  QRResultDialog({required this.scannedResult});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('autometa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
          Text(
            scannedResult ?? 'No QR code scanned',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add functionality for the button here
              Navigator.of(context).pop();
            },
            child: Text('Send attendance'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

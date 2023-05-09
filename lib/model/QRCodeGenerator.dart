import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  final String data;

  const QRCodeGenerator(
      {Key? key, required this.data, required TimeOfDay endTime})
      : super(key: key);

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: QrImage(
          data: widget.data,
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    );
  }
}

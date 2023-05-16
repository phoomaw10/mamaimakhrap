import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  // final String data;
  // final String studentNumber;
  // final int maxScan;
  final int round_id;

  const QRCodeGenerator({
    required this.round_id,
  });
  // const QRCodeGenerator(
  //     {Key? key,
  //     required this.data,
  //     required endTime,
  //     required this.studentNumber,
  //     required this.maxScan})
  //     : super(key: key);

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  late int _count;
  late StreamSubscription<int> _subscription;
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 177, 230, 252);

  @override
  void initState() {
    super.initState();
    _count = 0;
    _subscription = _loadCount().listen((count) {
      setState(() {
        _count = count;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 189, 255),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
            width: screenWidth,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 4),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop((context));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 56, 56, 154),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 55),
                      child: Text(
                        "QR Code Generator",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenHeight / 1.35,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 10),
                          height: screenHeight - 550,
                          width: screenWidth - 80,
                          child: Container(
                            child: QrImage(
                              data: '${widget.round_id}',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                        ),
                        Text(
                          'Scan count: $_count',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Center(
          //   child: Column(
          //     children: [
          //       QrImage(
          //         data: '${widget.studentNumber}:${widget.maxScan}:$_count',
          //         version: QrVersions.auto,
          //         size: 200.0,
          //       ),
          //       SizedBox(height: 16),
          //       Text(
          //         'Scan count: $_count',
          //         style: TextStyle(fontSize: 24),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Stream<int> _loadCount() async* {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${''}_count.txt');
    int count = 0;
    if (await file.exists()) {
      final contents = await file.readAsString();
      count = int.parse(contents);
    }
    yield count;
    await for (var countDelta in _countDeltaStream()) {
      count += countDelta;
      await file.writeAsString('$count');
      yield count;
    }
  }

  Stream<int> _countDeltaStream() async* {
    await for (var line
        in stdin.transform(utf8.decoder).transform(LineSplitter())) {
      if (line == '') {
        yield 1;
      }
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mamaimakhrap/InCoursePage.dart';
import 'package:mamaimakhrap/model/enrollUser.dart';
import 'package:mamaimakhrap/model/histories.dart';

// import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../caller.dart';

class QRCodeGenerator extends StatefulWidget {
  // final String data;
  // final String studentNumber;
  // final int maxScan;
  final int round_id;
  final DateTime endTime;
  // List<

  const QRCodeGenerator({
    required this.round_id, required this.endTime,
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
  List<HistoryRound> user_attend = [];
  double screenHeight = 0;
  int studentAmount = 0;
  double screenWidth = 0;
  String endTime = "";
  Color primary = const Color.fromARGB(255, 177, 230, 252);
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _count = 0;
    print('before count');
    // _subscription = _loadCount().listen((count) {
    //   setState(() {
    //     _count = count;
    //   });
    // });
    // fetchData(context);
    // _subscription = _loadCount().listen((count) {
    //   setState(() {
    //     _count = count;
    //   });
    // });

    final currentTime = DateTime.now();
    final difference = widget.endTime.difference(currentTime);

    Timer timer = new Timer(difference, () {
      debugPrint("Print after endtime.");
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('This QR code has expired.'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 56, 56, 154),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    print('fetchData');
    fetchData();
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      fetchData();
      print('refreshed');
    });
    // Move the code that depends on inherited widgets here
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
    timer.cancel();
  }

  void fetchData() async {
    try {
      // final id = ModalRoute.of(context)!.settings.arguments as int;
      print("in scan page");
      int roundId = widget.round_id;
      Response response = await Caller.dio.get("/course/rounds/$roundId");
      print("Response Data");
      print(response.data);
      setState(() {
        List<dynamic> owner_student = response.data;
        user_attend =
            owner_student.map((json) => HistoryRound.fromJson(json)).toList();
        print("//////////////////");
        print(user_attend);
        studentAmount = user_attend.length;
      });
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void dispose() {

  //   super.dispose();
  // }

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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: const Text(
                                'Warning',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 47, 109)),
                              ),
                              content: const Text(
                                  'If you close this page QR Code\nwill be end'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 56, 56, 154)),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 56, 56, 154),
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 56, 56, 154),
                                  ),
                                  onPressed: () {
                                    // dispose();
                                    // Timer.periodic(new Duration(seconds: 1),
                                    //     (timer) {
                                    //   timer.cancel();
                                    // });
                                    timer.cancel();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
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
                            fontSize: 20,
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
                children: [
                  SizedBox(
                    //height: screenHeight / 1,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 45),
                          height: screenHeight - 630,
                          width: screenWidth - 80,
                          child: Container(
                            child: QrImage(
                              data: '${widget.round_id}',
                              version: QrVersions.auto,
                              //size: 200.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Take screen shot of QR Code.",
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            "Checked ✅",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Text(
                            "Amount of Student = $studentAmount",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: screenWidth - 20,
                          width: screenWidth - 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 236, 242, 255),
                          ),
                          child: Container(
                              child: Column(
                            children: user_attend
                                .map((e) => customMember(
                                    e.owner?.firstname ?? '',
                                    e.owner?.avatarURL ?? '',
                                    e.owner?.lastname ?? ''
                                    // e.enrollUser?.firstname as String,
                                    // e.enrollUser?.avatarURL as String
                                    ))
                                .toList(),
                          )),
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

  Widget customMember(String hint, String avatar, String lastname
      //String date,
      ) {
    return Column(
      children: [
        Container(
          width: screenWidth - 40,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            color: Color.fromARGB(255, 236, 242, 255),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(avatar),
                    ),
                    title: Text(
                      hint + ' ' + lastname,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

getApplicationDocumentsDirectory() {}

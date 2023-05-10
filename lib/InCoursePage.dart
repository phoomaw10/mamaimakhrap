import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/SendFeedback.dart';
import 'package:mamaimakhrap/profile.dart';

import 'caller.dart';
import 'model/QRCodeGenerator.dart';
import 'model/class.dart';

class InCoursePage extends StatefulWidget {
  const InCoursePage({super.key});

  @override
  State<InCoursePage> createState() => _InCoursePageState();
}

class _InCoursePageState extends State<InCoursePage> {
  String _qrData = '';
  TimeOfDay _endTime =
      TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 2)));
  double screenHeight = 0;
  double screenWidth = 0;
  late int id;
  String name = '';
  String code = '';
  String join_code = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchData(context);
    });
  }

  void fetchData(BuildContext context) async {
    try {
      // final routeArguments =
      //     ModalRoute.of(context)!.settings.arguments as Map<String, int>;
      // final id = routeArguments["id"];
      // print("Id of course " + id.toString());
      // print('arguments');
      // print(routeArguments);
      final id = ModalRoute.of(context)!.settings.arguments as int;
      Response response = await Caller.dio.get("/course/$id");
      setState(() {
        final data = Course.fromJson(response.data);
        name = data.name;
        code = data.code;
        join_code = data.join_code;
        print(name);
      });
    } catch (e) {
      print(e);
    }
  }

  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  Color primary = const Color.fromARGB(255, 255, 255, 255);
  TextEditingController _textEditingController = TextEditingController();
  Profile profile = Profile(email: '', password: '');
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 188, 153),
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
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                        "Course",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                    )),
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: IconButton(
                            onPressed: () {
                              _showQrCodeGeneratorDialog(context);
                            },
                            icon: const Icon(
                              Icons.qr_code,
                              size: 35,
                              color: Color.fromARGB(255, 5, 47, 109),
                            ))),
                  ],
                ),
              )),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              code,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 154),
                              ),
                            ),
                            subtitle: Text(name),
                          ),
                          ListTile(
                            title: Text(
                              'Join Code : ' + join_code,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: SizedBox(
                      child: Column(
                        children: const <Widget>[
                          ListTile(
                            title: Text(
                              'Member',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 56, 56, 154),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenWidth - 40,
                    width: screenWidth - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 236, 242, 255),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          customMember('Nawat Sujjaritrat'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget customMember(
    String hint,
    //String date,
  ) {
    return Column(
      children: [
        Container(
          width: screenWidth - 40,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 236, 242, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      title: const Text(
                        'Action',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                      actions: <Widget>[
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SendFeedback()));
                                },
                                child: ListTile(
                                  leading: Icon(Icons.feedback),
                                  title: Text(
                                    "Feedback",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 30, left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Color.fromARGB(
                                              255, 236, 242, 255),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          title: const Text(
                                            'Warning',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 5, 47, 109)),
                                          ),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    text:
                                                        'Are you sure to kick\n ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: hint + ' ?',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      0,
                                                                      0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                              )
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 154),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(
                                                  'No',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 154),
                                                  ),
                                                )),
                                            TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 56, 56, 154),
                                                  side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 154),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                ))
                                          ],
                                        );
                                      });
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.block,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    "Kick",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage("images/face.jpeg"),
                    ),
                    title: Text(
                      hint,
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

  Widget customFieldNumber(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      width: screenWidth,
      child: Row(
        children: [
          Container(
            width: screenWidth / 10,
            child: Icon(
              Icons.person,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 12),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Number of student"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   dateController.text = "";
  // }

  @override
  void initTime() {
    timeinput.text = "";
    super.initState();
  }

  void _showQrCodeGeneratorDialog(BuildContext context) {
    int _numberOfStudents = 0;
    int _maxScan = 0;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Generate QR Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Number of Student',
                ),
                onChanged: (value) {
                  setState(() {
                    _qrData = value;
                  });
                },
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: _endTime,
                  );
                  if (selectedTime != null) {
                    setState(() {
                      _endTime = selectedTime;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'End Time',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      _endTime.format(context),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeGenerator(
                      data: _qrData,
                      endTime: _endTime, maxScan: _maxScan, studentNumber: '',
                    ),
                  ),
                );
              },
              child: Text('Generate'),
            ),
          ],
        );
      },
    );
  }
}

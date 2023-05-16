import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/CoursePage.dart';
import 'package:mamaimakhrap/caller.dart';

class SendFeedback extends StatefulWidget {
  const SendFeedback({super.key});

  @override
  State<SendFeedback> createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  late int id;
  String name = '';
  String code = '';
  String join_code = '';
  String studentfName = '';
  String studentlName = '';
  String studentProfileUrl = '';
  int courseIdSent = 0;
  int studentIdSent = 0;
  // int courseId = 0;
  // int studentId = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final routeArguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, int>;
      final courseId = routeArguments["courseId"];
      final studentId = routeArguments["studentId"];
      print(courseId);
      print(studentId);
      fetchData(context, courseId!, studentId!);
    });
  }

  void fetchData(BuildContext context, int courseId, int studentId) async {
    try {
      // final routeArguments =
      //     ModalRoute.of(context)!.settings.arguments as Map<String, int>;
      // final id = routeArguments["id"];
      // print("Id of course " + id.toString());
      // print('arguments');
      // print(routeArguments);
      print('before set state');
      // final id = ModalRoute.of(context)!.settings.arguments as int;
      Response response =
          await Caller.dio.get("/course/$courseId/students/$studentId");

      setState(() {
        print('test');
        List<dynamic> enroll_Student = response.data["enrolled_users"];
        print(1212);
        print(enroll_Student);
        Map<String, dynamic> fetchCourse = response.data;
        name = fetchCourse['name'];
        code = fetchCourse['code'];
        join_code = fetchCourse['join_code'];
        studentfName = enroll_Student[0]['firstname'];
        print(fetchCourse);
        print(studentfName);
        studentlName = enroll_Student[0]['lastname'];
        studentProfileUrl = enroll_Student[0]['avatar_url'];
        courseIdSent = fetchCourse['id'];
        studentIdSent = enroll_Student[0]['id'];
        print('this is student id');
        print(studentId);

        print(111111);
        // final List<dynamic> listStudent = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  void saveInfo(int courseId, int studentId) {
    FocusManager.instance.primaryFocus?.unfocus();
    Caller.dio.post("/course/$courseId/students/$studentId", data: {
      "feedback_text": _textEditingController.text,
    }).then((response) {
      print(courseId);
      print(studentId);
    }).onError((DioError error, _) {
      Caller.handle(context, error);
    }).whenComplete(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sent Complete"),
            );
          });
    });
  }

  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 255, 255, 255);
  TextEditingController _join_code = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
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
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_circle_left_rounded,
                            size: 40,
                            color: Color.fromARGB(255, 56, 56, 154),
                          )),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "Course",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 47, 109)),
                      ),
                    )),
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
                    margin: EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                          customMember(studentfName)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight / 1.8,
                    width: screenWidth - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 236, 242, 255),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 20, left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: TextField(
                                    controller: _textEditingController,
                                    maxLines: 22,
                                    minLines: 1,
                                  ),
                                ),
                              ],
                            )),
                        IconButton(
                            onPressed: () {
                              saveInfo(courseIdSent, studentIdSent);
                            },
                            icon: Icon(
                              Icons.send_rounded,
                              size: 30,
                            ))
                      ],
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
                /*showDialog(
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
                                onTap: () {},
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
                                onTap: () {},
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
              */
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(181, 214, 213, 213),
                        spreadRadius: 0.1,
                        blurRadius: 0.5,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.white70,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white70,
                        offset: Offset(5, 0),
                      )
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(studentProfileUrl),
                      ),
                      title: Text(
                        hint + ' ' + studentlName,
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
        ),
      ],
    );
  }
}

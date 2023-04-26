import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mamaimakhrap/HistoryPage.dart';
import 'package:mamaimakhrap/QRCodePage.dart';
import 'package:mamaimakhrap/StudentHomePage.dart';
import 'package:mamaimakhrap/studentProfile.dart';

class ConfirmQR extends StatefulWidget {
  const ConfirmQR({super.key});

  @override
  State<ConfirmQR> createState() => _ConfirmQRState();
}

class _ConfirmQRState extends State<ConfirmQR> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 177, 230, 252);
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
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  "QR Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 47, 109)),
                ),
              )),
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
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80, bottom: 10),
                        height: screenHeight - 650,
                        width: screenWidth - 80,
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 170,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                          child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'You have ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'successfully\n',
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(
                                text: 'attendance',
                              )
                            ]),
                      )),
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Refresh action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 5, 47, 109),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Finish',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: screenWidth - 60,
                    height: screenHeight / 12,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 242, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.book),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HistoryPage()));
                          },
                          icon: const Icon(Icons.history),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentHomePage()));
                          },
                          icon: const Icon(Icons.home),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QRCodePage()));
                          },
                          icon: const Icon(Icons.qr_code),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const studentProfile()));
                          },
                          icon: const Icon(Icons.person),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customField(
    String hint,
    String date,
  ) {
    return Column(children: [
      Container(
          width: screenWidth - 40,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
              color: const Color.fromARGB(255, 236, 242, 255),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: screenWidth / 10,
                      ),
                      title: Text(
                        hint,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 56, 56, 154),
                        ),
                      ),
                      subtitle: Text(date),
                    )
                  ])))
    ]);
  }
}

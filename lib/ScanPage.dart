import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
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
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        height: screenHeight - 550,
                        width: screenWidth - 80,
                        color: Color.fromARGB(255, 236, 242, 255),
                      ),
                      Container(
                        child: Text(
                          'Estimate time of QR code : 3.00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
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
                              Icon(Icons.refresh, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Refresh',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
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

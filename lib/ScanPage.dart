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
                  "Scan",
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
                    child: Column(children: []),
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
                          onPressed: () {},
                          icon: const Icon(Icons.history),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.home),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code),
                          iconSize: 30,
                          color: const Color.fromARGB(255, 55, 56, 128),
                        ),
                        IconButton(
                          onPressed: () {},
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
}

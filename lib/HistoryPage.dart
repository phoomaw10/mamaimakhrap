import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 177, 230, 252);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 230, 252),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 100,
              width: screenWidth,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Center(
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 47, 109)),
                  ),
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
                  SizedBox(
                    height: screenHeight / 1.4,
                    child: Column(children: [
                      customField('CSC111','Thursday 13 April 2023 13.30 - 16.30 pm'),
                      customField('CSC213','Thursday 13 April 2023 13.30 - 16.30 pm'),
                      customField('CSC102','Thursday 13 April 2023 13.30 - 16.30 pm')
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

  Widget customField(
    String hint,
    String date,
  ) {
    return  Column(children: [
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
                                      leading: Icon(Icons.check_circle_rounded, color: Colors.green, size: screenWidth / 10,),
                                      title: Text(
                                        hint,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 56, 56, 154),
                                        ),
                                      ),
                                      subtitle: Text(
                                          date),
                                    )
                                  ])))
                    ]);
  }
}

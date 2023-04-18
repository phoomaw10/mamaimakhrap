import 'package:flutter/material.dart';

class studentProfile extends StatefulWidget {
  const studentProfile({super.key});

  @override
  State<studentProfile> createState() => _studentProfile();
}

class _studentProfile extends State<studentProfile> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 191, 134),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
              height: 100,
              width: screenWidth,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Center(
                  child: Text(
                    "Student",
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
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout_rounded),
                          color: const Color.fromARGB(255, 55, 56, 128),
                          iconSize: screenWidth / 10,
                        )
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/face.jpeg'),
                    radius: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "First name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  customField('Nawat'),
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Last name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  customField('Sujjaritrat'),
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Faculty",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  customField('School of Information Technology'),
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Department",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  customField('Computer Science'),
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  customField('nawat.sujj@kmutt.ac.th'),
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
  ) {
    return Container(
        width: screenWidth - 80,
        height: screenHeight / 17,
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 242, 255),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
              const BoxShadow(
                color: Colors.white70,
                offset: Offset(-5, 0),
              ),
              const BoxShadow(
                color: Colors.white70,
                offset: Offset(5, 0),
              )
            ]),
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                hint,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ));
  }
}
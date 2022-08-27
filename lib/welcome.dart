import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/Home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int messageNumber = 0;
  List _welcomeMessage = [
    {
      "title": "Smart wallet for everyone",
      "message":
          'is a long established fact that a reader will be distracted by the readable'
              ' content of a page when looking at its'
              ' layout. The point of using Lorem Ipsum is that it has a more-or-less '
              'normal distribution of letters, as opposed to using'
    },
    {
      "title": "How to get wallet",
      "message":
          'is a long established fact that a reader will be distracted by the readable'
              ' layout. The point of using Lorem Ipsum is that it has a more-or-less '
              'normal distribution of letters, as opposed to using'
    },
    {
      "title": "Welcome in wallet",
      "message":
          'is a long established fact that a reader will be distracted by the readable'
              ' content of a page when looking at its'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'wallet',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: SvgPicture.asset(
              'images/3.svg',
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          SizedBox(
            height: 30,
          ),
          //  --------------------
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              color: Color(0xFF232225),
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${_welcomeMessage[messageNumber]['title']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${_welcomeMessage[messageNumber]['message']}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Color(0xFF282828),
                          backgroundColor: Color(0xFF7791c7),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_welcomeMessage.length-1 == messageNumber) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            } else {
                              messageNumber = messageNumber + 1;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.arrow_right_alt)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          backgroundColor: Color(0xFF282828),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

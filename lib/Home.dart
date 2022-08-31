import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/Constant/Color.dart';
import 'package:wallet/Transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: background,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                bar(),
                SizedBox(
                  height: 50,
                ),
                visa(context),
                option(context),
                SizedBox(
                  height: 20,
                ),
                bills(context),
                SizedBox(
                  height: 20,
                ),
                transaction(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bar() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          "images/menuBar.svg",
          color: Colors.white,
        ),
        Text(
          "Your Account",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
        ),
        SvgPicture.asset(
          "images/bell.svg",
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget visa(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bank Transfer",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 25),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Image.asset(
            'images/visaBlack.gif',
            // 'images/visaBlue.gif',
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
          ),
          // child: SvgPicture.asset(
          //   'images/1.svg',
          // height: MediaQuery.of(context).size.height / 3,
          // width: MediaQuery.of(context).size.width,
          // ),
        ),
      ],
    ),
  );
}

Widget option(BuildContext context) {
  List list1 = [
    {'name': 'Withdraw', 'icon': 'rotate-right', 'color': Color(0xFF8eb6fc)},
    {'name': 'Top up', 'icon': 'add', 'color': Color(0xFFffdcb2)},
  ];
  List list2 = [
    {'name': 'Transfer', 'icon': 'refresh', 'color': Color(0xFFf190a9)},
    {'name': 'More', 'icon': 'grid', 'color': Color(0xFF94e17e)},
  ];

  Widget subOption(icon, name, customcolor) {
    print(icon);
    print(name);
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF38383b),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: customcolor, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  "images/option/${icon}.svg",
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            // Image.asset(
            //   'images/option/${icon}.gif',
            //   width: 50,
            //   height: 50,
            // ),
            // Icon(Icons.reload),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  return Container(
      child: Column(
    children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list1
              .map((e) => subOption(e['icon'], e['name'], e['color']))
              .toList()),
      SizedBox(
        height: 20,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list2
              .map((e) => subOption(e['icon'], e['name'], e['color']))
              .toList()),
    ],
  ));
}

Widget bills(BuildContext context) {
  List _pay = [
    {'name': 'Water', 'icon': 'raindrops','color': Color(0xFF8eb6fc)},
    {'name': 'Electricity', 'icon': 'bolt','color': Color(0xFFffcc8e)},
    {'name': 'Internet', 'icon': 'globe','color': Color(0xFFc690f1)},
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 25),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Transaction(),
                    ),
                  );
                }),
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _pay
                .map((e) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color(0xFF38383b),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Image.asset(
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  "images/bill/${e['icon']}.svg",
                                  width: 60,
                                  height: 60,
                                  color: e['color'],
                                ),
                              ),
                              //   'images/bill/${e['icon']}.png',
                              //   width: 80,
                              //   // height: 100,
                              // ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                e['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    ),
  );
}

Widget transaction(BuildContext context) {
  List _transactions = [
    {
      'name': 'paypal',
      'icon': 'Paypal',
      'date': '2-3-2030',
      'amount': '200.5',
      'type': 'outcome'
    },
    {
      'name': 'youtube',
      'icon': 'YouTube',
      'date': '2-3-2030',
      'amount': '4500',
      'type': 'income'
    },
    {
      'name': 'facebook',
      'icon': 'Facebook',
      'date': '2-3-2030',
      'amount': '4500',
      'type': 'income'
    },
    {
      'name': 'instagram',
      'icon': 'Instagram',
      'date': '2-3-2030',
      'amount': '4500',
      'type': 'outcome'
    },
    {
      'name': 'snapchat',
      'icon': 'Snapchat',
      'date': '2-3-2030',
      'amount': '4500',
      'type': 'outcome'
    },
  ];
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 25),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Transaction(),
                    ),
                  );
                }),
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
            ],
          ),

          // ---------
          Column(
            children: _transactions
                .map(
                  (e) => Card(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xFF38383b),
                    child: ListTile(
                      leading: Image.asset(
                        'images/transaction/${e['icon']}.png',
                        width: 70,
                        height: 70,
                      ),
                      title: Text(
                        '${e['name']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '${e['date']}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                      trailing: Text(
                        '${e['amount']} EGP',
                        style: TextStyle(
                            color: e['type'] == 'income'
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      )));
}

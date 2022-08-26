import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/Constant/Color.dart';

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
        child: SingleChildScrollView(
          child: Container(
            color: background,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                bar(),
                SizedBox(
                  height: 50,
                ),
                visa(context),
                // SizedBox(height: 20,),
                option(context)
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
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        Text(
          "Your Account",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
        ),
        Icon(
          Icons.notifications_active,
          color: Colors.white,
          size: 30,
        ),
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
          child: SvgPicture.asset(
            'images/1.svg',
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    ),
  );
}

Widget option(BuildContext context) {
  List list1 = ['Withdraw', 'Top up'];
  List list2 = ['Transfer', 'More'];

  Widget subOption(icon, name) {
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
            Icon(
              icon,
              color: Colors.white,
            ),
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
      height: 300,
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: list1.map((e) => subOption(Icons.ac_unit, e)).toList()),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: list2.map((e) => subOption(Icons.ac_unit, e)).toList()),
        ],
      ));
}

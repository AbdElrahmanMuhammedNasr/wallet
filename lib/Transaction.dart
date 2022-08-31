import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/Constant/Color.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
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
                bar(context),
                inOutCome(context),
                graph(context),
                transaction(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bar(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "images/angle-left.svg",
            color: Colors.white,
          ),
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Total Balance",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "161.202 EGP",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        SvgPicture.asset(
          "images/bell.svg",
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget inOutCome(BuildContext context) {
  List monthDetails = [
    {
      'title': ' Income',
      'money': '12055',
      'date': 'Last Month',
      'color': Colors.green.shade300
    },
    {
      'title': ' Outcome',
      'money': '12055',
      'date': 'Last Month',
      'color': Colors.red.shade300
    }
  ];
  return Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: monthDetails
            .map((e) => Card(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(0xFF38383b),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e['title']}",
                            style: TextStyle(
                              color: e['color'],
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "${e['money']} EGP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "${e['date']}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList()),
  );
}
// =================================================================

class _SplineAreaData {
  _SplineAreaData(this.year, this.y1);
  final double year;
  final double y1;
}

Widget graph(BuildContext context) {
  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    List<_SplineAreaData> chartData = <_SplineAreaData>[
      _SplineAreaData(1, 10.53),
      _SplineAreaData(2, 9.5),
      _SplineAreaData(3, 10),
      _SplineAreaData(4, 9.4),
      _SplineAreaData(5, 5.8),
      _SplineAreaData(6, 4.9),
      _SplineAreaData(7, 4.5),
      _SplineAreaData(8, 3.6),
      _SplineAreaData(9, 3.43),
      _SplineAreaData(10, 10),
      _SplineAreaData(11, 3.43),
      _SplineAreaData(12, 3.43),
    ];

    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: Colors.red,
        borderWidth: 3,
        name: 'Month',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
    ];
  }

  return Card(
    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    color: Color(0xFF38383b),
    child: SfCartesianChart(
      legend: Legend(isVisible: false, opacity: 0.7),
      title:
          ChartTitle(text: '2022', textStyle: TextStyle(color: Colors.white)),
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    ),
  );
}
// =================================================================

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

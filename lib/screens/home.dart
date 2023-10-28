import 'package:covidstat/Models/worlddata.dart';
import 'package:covidstat/screens/datascreen.dart';

import 'package:covidstat/services/alldata.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AllData manager = AllData();

  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          future: manager.getdata(),
          builder: ((context, AsyncSnapshot<WorldData> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.1 * width),
                        height: 0.4 * height,
                        width: double.infinity,
                        child: PieChart(
                          chartType: ChartType.disc,
                          dataMap: {
                            'infected':
                                double.parse(snapshot.data!.active.toString()),
                            'recovered': double.parse(
                                snapshot.data!.recovered.toString()),
                          },
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                            chartValueBackgroundColor: Colors.green,
                            chartValueStyle: TextStyle(color: Colors.white),
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        print('tapped gesture detector');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DataScreen();
                        }));
                      },
                      child: Container(
                        height: 0.07 * height,
                        width: 0.8 * width,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(child: Text('Covid Data')),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/countries');
                      },
                      child: Container(
                        height: 0.07 * height,
                        width: 0.8 * width,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(child: Text('country Data')),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    ));
  }
}

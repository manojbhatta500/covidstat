import 'package:covidstat/Models/worlddata.dart';
import 'package:covidstat/custom/customrow.dart';
import 'package:covidstat/services/alldata.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen>
    with SingleTickerProviderStateMixin {
  AllData manager = AllData();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Covid data'),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: manager.getdata(),
                builder: ((context, AsyncSnapshot<WorldData> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: TabBar(controller: tabController, tabs: [
                            Tab(
                              child: Text(
                                'Total',
                              ),
                            ),
                            Tab(
                              child: Text("Today"),
                            ),
                            Tab(
                              child: Text('Per million'),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 0.1 * height,
                        ),
                        Container(
                          height: 0.35 * height,
                          width: double.infinity,
                          child:
                              TabBarView(controller: tabController, children: [
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: 0.1 * width),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Card(
                                elevation: 25,
                                child: Column(
                                  children: [
                                    CustomRow(
                                        question: 'Total cases',
                                        answer: snapshot.data!.cases),
                                    CustomRow(
                                        question: 'recovered',
                                        answer: snapshot.data!.recovered),
                                    CustomRow(
                                        question: 'deaths',
                                        answer: snapshot.data!.deaths),
                                    CustomRow(
                                        question: 'active',
                                        answer: snapshot.data!.active),
                                    CustomRow(
                                        question: 'critical',
                                        answer: snapshot.data!.critical),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: 0.1 * width),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Card(
                                elevation: 25,
                                child: Column(
                                  children: [
                                    CustomRow(
                                        question: 'today Cases',
                                        answer: snapshot.data!.todayCases),
                                    CustomRow(
                                        question: 'todayDeaths',
                                        answer: snapshot.data!.todayDeaths),
                                    CustomRow(
                                        question: 'todayRecovered',
                                        answer: snapshot.data!.todayRecovered),
                                    CustomRow(
                                        question: 'critical',
                                        answer: snapshot.data!.critical),
                                    CustomRow(
                                        question: 'affectedCountries',
                                        answer:
                                            snapshot.data!.affectedCountries),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: 0.1 * width),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Card(
                                elevation: 25,
                                child: Column(
                                  children: [
                                    CustomRow(
                                        question: 'cases Per Million',
                                        answer:
                                            snapshot.data!.casesPerOneMillion),
                                    CustomRow(
                                        question: 'deaths Per Million',
                                        answer:
                                            snapshot.data!.deathsPerOneMillion),
                                    CustomRow(
                                        question: 'active Per Million',
                                        answer:
                                            snapshot.data!.activePerOneMillion),
                                    CustomRow(
                                        question: 'recovered Per Million',
                                        answer: snapshot
                                            .data!.recoveredPerOneMillion),
                                    CustomRow(
                                        question: 'critical Per Million',
                                        answer: snapshot
                                            .data!.criticalPerOneMillion),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    );
                  }
                }))));
  }
}

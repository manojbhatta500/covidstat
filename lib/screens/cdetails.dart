import 'package:covidstat/custom/customrow.dart';

import 'package:flutter/material.dart';

class Cdetails extends StatefulWidget {
  String countryname;
  String countryflag;
  String continent;
  String totalpop;
  String totalcases;
  String deaths;
  String recovered;
  String active;
  String critial;
  Cdetails({
    required this.countryname,
    required this.countryflag,
    required this.continent,
    required this.totalpop,
    required this.totalcases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.critial,
  });

  @override
  State<Cdetails> createState() => _CdetailsState();
}

class _CdetailsState extends State<Cdetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.countryname),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              '${widget.countryflag}',
              height: 100,
              width: 100,
            ),
            CustomRow(
                question: 'Country', answer: widget.countryname.toString()),
            CustomRow(
                question: 'Continent', answer: widget.continent.toString()),
            CustomRow(
                question: 'Population', answer: widget.totalpop.toString()),
            CustomRow(question: 'Cases', answer: widget.totalcases.toString()),
            CustomRow(question: 'Active', answer: widget.active.toString()),
            CustomRow(
                question: 'Recovered', answer: widget.recovered.toString()),
            CustomRow(question: 'Death', answer: widget.deaths.toString()),
            CustomRow(question: 'Critical', answer: widget.critial.toString()),
          ],
        ),
      ),
    ));
  }
}

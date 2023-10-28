import 'package:covidstat/screens/cdetails.dart';
import 'package:covidstat/services/alldata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  AllData manager = AllData();
  TextEditingController tag = TextEditingController();
  late String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: tag,
                onChanged: ((value) {
                  setState(() {});
                }),
                decoration: InputDecoration(
                  hintText: 'Search Coutries',
                  fillColor: Colors.white12,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            FutureBuilder(
                future: manager.countrydata(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Loading, please wait')
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              name =
                                  snapshot.data![index]['country'].toString();
                              if (tag.text.isEmpty) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Cdetails(
                                        countryname: snapshot.data![index]
                                                ['country']
                                            .toString(),
                                        countryflag: snapshot.data![index]
                                                ['countryInfo']['flag']
                                            .toString(),
                                        continent: snapshot.data![index]
                                                ['continent']
                                            .toString(),
                                        totalpop: snapshot.data![index]
                                                ['population']
                                            .toString(),
                                        totalcases: snapshot.data![index]
                                                ['cases']
                                            .toString(),
                                        deaths: snapshot.data![index]['deaths']
                                            .toString(),
                                        recovered: snapshot.data![index]
                                                ['recovered']
                                            .toString(),
                                        active: snapshot.data![index]['active']
                                            .toString(),
                                        critial: snapshot.data![index]
                                                ['critical']
                                            .toString(),
                                      );
                                    }));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: ListTile(
                                      leading: Image.network(
                                        snapshot.data![index]['countryInfo']
                                            ['flag'],
                                        width: 50,
                                        height: 50,
                                      ),
                                      trailing:
                                          Icon(CupertinoIcons.arrow_right),
                                      title: Text(
                                        '${snapshot.data![index]['country']}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      subtitle: Text(
                                          'Active: ${snapshot.data![index]['active'].toString()}'),
                                    ),
                                  ),
                                );
                              } else if (name
                                  .toLowerCase()
                                  .contains(tag.text.toLowerCase())) {
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    leading: Image.network(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                      width: 50,
                                      height: 50,
                                    ),
                                    trailing: Icon(CupertinoIcons.arrow_right),
                                    title: Text(
                                      '${snapshot.data![index]['country']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: Text(
                                        'Active: ${snapshot.data![index]['active'].toString()}'),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })));
                  }
                })
          ],
        ),
      ),
    ));
  }
}

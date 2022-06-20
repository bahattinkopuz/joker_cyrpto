import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joker_cyrpto/detail.dart';
import 'package:joker_cyrpto/models/cyrpto.dart';
import 'dart:convert';

class Analyze extends StatefulWidget {
  const Analyze({Key? key}) : super(key: key);

  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  late Future<List<Cyrpto>> data;

  Future<List<Cyrpto>> _getCyrptoList() async {
    var response = await http.get(Uri(
        scheme: 'http',
        host: 'www.bahattinkopuz.xyz',
        path: '/CyrptoJoker/List'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Cyrpto.fromJson(e))
          .toList();
    } else {
      throw Exception("${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    data = _getCyrptoList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot<List<Cyrpto>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(snapshot.data![index].shortName),
                      subtitle: Text(snapshot.data![index].name),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.black),
                      leading: CircleAvatar(
                        child: Image.network(snapshot.data![index].imgPath),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Detail(
                                  pCoinName: snapshot.data![index].shortName,
                                )));
                      },
                    ),
                  );
                }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

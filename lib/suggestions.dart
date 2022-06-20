import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'detail_fulscreen.dart';
import 'models/suggestion.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  late Future<List<Suggestion>> data;
  String coinName = "";

  Future<List<Suggestion>> _getCyrptoDetail() async {
    var response = await http.get(Uri(
        scheme: 'http',
        host: 'www.bahattinkopuz.xyz',
        path: '/CyrptoJoker/Detail',
        queryParameters: {'CoinName': "SUGGESTIONS"}));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Suggestion.fromJson(e))
          .toList();
    } else {
      throw Exception("${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    data = _getCyrptoDetail();
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FutureBuilder(
          future: data,
          builder:
              (BuildContext context, AsyncSnapshot<List<Suggestion>> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _generateCard(
                          snapshot.data![index].imgPath,
                          snapshot.data![index].title,
                          snapshot.data![index].text,
                          snapshot.data![index].updateTime,
                          snapshot.data![index].direction);
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  GestureDetector _generateCard(
      String imgPath, String title, String text, DateTime time, int arrow) {
    String timeStr = time.toString();
    timeStr = timeStr.substring(0, timeStr.length - 4);

    return GestureDetector( 
      child: GFCard(
        boxFit: BoxFit.cover,
        title: GFListTile(
          avatar: GFAvatar(
            backgroundImage: arrow == 1
                ? const AssetImage("assets/up_arrow.png")
                : arrow == 2
                    ? const AssetImage("assets/down_arrow.png")
                    : const AssetImage("assets/notr_arrow.png"),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 17),
          ),
          subTitle: Text(
            timeStr,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        image: Image.network(imgPath),
        content: Text(text, style: const TextStyle(fontSize: 15)),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailFullScreen(
                  imagePath: imgPath,
                )));
      },
    );
  }
}

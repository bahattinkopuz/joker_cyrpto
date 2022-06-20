import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';
import 'package:joker_cyrpto/analyze.dart';
import 'package:joker_cyrpto/portfolio.dart';
import 'package:joker_cyrpto/suggestions.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  //Main UI - Main loop
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GFColors.DARK,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
                height: 45,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Cyrpto Joker",
                  style: TextStyle(fontFamily: "Palatino"),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: buildGFTabBar(),
        body: buildGFTabView(),
      ),
    );
  }

  GFTabBar buildGFTabBar() {
    return GFTabBar(
      length: 3,
      controller: tabController,
      tabBarColor: GFColors.DARK,
      indicatorColor: Colors.lightBlue,
      labelColor: Colors.lightBlue,
      unselectedLabelColor: Colors.white,
      indicatorPadding: const EdgeInsets.all(5),
      tabs: const [
        Tab(
          icon: Icon(
            Icons.assignment,
            size: 20,
          ),
          text: "Yorum",
          iconMargin: EdgeInsets.all(5),
        ),
        Tab(
          icon: Icon(
            Icons.assessment,
            size: 20,
          ),
          text: "Analiz",
          iconMargin: EdgeInsets.all(5),
        ),
        Tab(
          icon: Icon(
            Icons.assessment_outlined,
            size: 20,
          ),
          text: "Portföy",
          iconMargin: EdgeInsets.all(5),
        ),
      ],
    );
  }

  GFTabBarView buildGFTabView() {
    return GFTabBarView(
      controller: tabController,
      children: [Suggestions(), const Analyze(), Portfolio()],
    );
  }
}

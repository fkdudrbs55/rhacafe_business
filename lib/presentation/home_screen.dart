import 'package:flutter/material.dart';
import 'package:rhacafe_business/presentation/recent_visit_tab_screen.dart';

import 'loyalty_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabController tabController;

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              print("Menu button on app bar");
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black,),
              onPressed: () {
                print("Search button on app bar");
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorColor: Colors.brown,
              tabs: <Widget>[
                Tab(
                  child: Container(
                    height: 20,
//                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: <Widget>[
//                    Icon(Icons.menu, color: Colors.brown,),
                        Text(
                          '적립하기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 20,
//                    decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      children: <Widget>[
//                    Icon(Icons.menu, color: Colors.brown,),
                        Text(
                          '최근방문',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[LoyaltyTabScreen(), RecentVisitTabScreen()],
        ),
      ),
    );
  }
}

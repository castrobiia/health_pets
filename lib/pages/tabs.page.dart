import 'package:flutter/material.dart';
import 'package:health_pets/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: new Icon(Icons.pets),
          ),
          Tab(
            icon: new Icon(Icons.person),
          ),
          Tab(
            icon: new Icon(Icons.calendar_today),
          ),
          Tab(
            icon: new Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

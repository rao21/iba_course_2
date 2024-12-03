import 'package:flutter/material.dart';
import 'package:iba_course_2/lect1/list_view.dart';
import 'package:iba_course_2/lect2/snack_bar.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Lecture # 2 - Widget'),
          bottom: const TabBar(tabs: [
                 Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
          ],),
        ),
      drawer: const Drawer(
        width: 200,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 128,),
            ListTile(title: Text('Option 1'),),
            ListTile(title: Text('Option 2'),),
            ListTile(title: Text('Option 3'),),
          ],),
        ),
      ),
      body: const TabBarView(
              children: [
              /*1*/  ListPage(title:''),
                CustomSnackBar(),
                Icon(Icons.directions_bike),
              ],
            ),
      ),
    );
  }
}



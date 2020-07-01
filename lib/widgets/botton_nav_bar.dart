import 'package:flutter/material.dart';
import 'package:medico/ui/Home.dart';

class BottomBar extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
//
//
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
      bottomNavigationBar:
       BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: Text('Home'),
            backgroundColor: Color(0xFF00796B)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
            backgroundColor: Colors.blue

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
            backgroundColor: Color(0xFF00796B)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,

    ),
      floatingActionButton: ChatIcon(context),
      //drawer: AppDrawer(),
    );
  }
}

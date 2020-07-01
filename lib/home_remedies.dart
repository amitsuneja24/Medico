import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
class homeRemedy extends StatefulWidget {
  @override
  _homeRemedyState createState() => new  _homeRemedyState();
}

class _homeRemedyState extends State<homeRemedy> {
  List data;
  int _currentItem=0;
  void _onItemTapped(int index) {
    setState(() {
      _currentItem = index;
    });
  }
  Icon customIon=Icon(Icons.search);
  Widget customText=Text("HOME REMEDIES");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar:new  AppBar(
//        actions: <Widget>[
//
//          IconButton(icon:customIon,onPressed: (){
//            setState(() {
//
//
//             if(this.customIon.icon==Icons.search){
//               this.customIon=Icon(Icons.cancel);
//                   this.customText=TextField(
//                     textInputAction: TextInputAction.go,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Search here"
//                     ),
//
//                     style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),);
//             }
//             else{
//               this.customIon=Icon(Icons.search);
//               this.customText=Text("HOME REMEDIES");
//             }
//            });
//          },),
//          IconButton(icon: Icon(Icons.more_vert),onPressed: (){},)
//        ],
//        leading:  Builder(
//          builder: (BuildContext context) {
//            return IconButton(
//              icon: const Icon(Icons.menu),
//              onPressed: () {   Navigator.pop(context);
//              },
//              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
//            );
//          },
//        ),
//        title: customText,
//        centerTitle: true,
//
//      ),
      body: new Container(
        child: new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('data/symptoms.json'),
          builder: (BuildContext context,AsyncSnapshot snapshot){
           var mydata=json.decode(snapshot.data.toString());
           print(mydata);
           return new ListView.builder(itemBuilder: (BuildContext context,int index){
             return new Card(
               child: new Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   new Text("Name:"+mydata[index]['name']),
                   //new Text("OverView"+mydata[index]['overview']),
                   //new Text("Cause:"+mydata[index]['causes']),
                   //new Text("Symptoms:"+mydata[index]['symptoms'])
                 ],
               ),
             );
           },
           itemCount:mydata==null? 0: mydata.length,
           );}
        ),
      ) ,
//      bottomNavigationBar:BottomNavigationBar(
//          currentIndex: _currentItem,
//          type: BottomNavigationBarType.shifting,
//
//          selectedItemColor: Colors.green,
//          items: [
//            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home'),backgroundColor: Color(0xFF00796B)),
//            BottomNavigationBarItem(
//              //activeIcon: ,
//
//                icon:IconButton(icon: Icon(Icons.cached),onPressed:(){Navigator.push(context, MaterialPageRoute(
//                    builder: (context) =>
//                        homeRemedy()));
//                } ,),backgroundColor: Colors.pink,title: Text("Home Remedies"))
//            ,
//            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('HomeRen'),backgroundColor: Color(0xFF00796B)),
//            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Homesxkj'),backgroundColor: Color(0xFF00796B))
//          ],
//          onTap: _onItemTapped
//      ) ,
    );
  }
}








//import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'dart:async' show Future;
//import 'package:flutter/services.dart' show rootBundle;
//
//class Symtom {
//  String name;
//  String overview;
//  Symtom({this.name, this.overview});
//
//  factory Symtom.fromJson(Map<String, dynamic> parsedJson) {
//    return Symtom(
//        name: parsedJson['name'],
//        overview: parsedJson['overview'],);
//  }
//}
//
//Future<String> _loadASymtomAsset() async {
//  return await rootBundle.loadString('assets/symptoms.json');
//}
//
//Future<Symtom> loadSymtom() async {
//  await wait(5);
//  String jsonString = await _loadASymtomAsset();
//  final jsonResponse = json.decode(jsonString);
//  print(jsonResponse);
//  return new Symtom.fromJson(jsonResponse);
//}
//
//Future wait(int seconds) {
//  return new Future.delayed(Duration(seconds: seconds), () => {});
//}
//
//
//class My extends StatefulWidget {
//  My();
//  @override
//  MyState createState() => MyState();
//}
//
//class MyState extends State<My> {
//  Widget futureWidget() {
//    return new FutureBuilder<Symtom>(
//      future: loadSymtom(),
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return new Container(
//              padding: new EdgeInsets.all(20.0),
//              child: new Row(
//                children: <Widget>[
//                  Text(
//                      "Med: ${snapshot.data.name} Overview  ${snapshot.data.overview}  ")
//                ],
//              ));
//        } else if (snapshot.hasError) {
//          return new Text("${snapshot.error}");
//        }
//        return new CircularProgressIndicator();
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new Scaffold(
//        appBar: new AppBar(
//        title: new Text('Load Json'),
//    ),
//    body: futureWidget()
//    ));
//    }
//}

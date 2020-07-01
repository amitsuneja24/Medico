import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //Future <Diseases> data;
  static int itemcount = 20;
  var firebaseDB = Firestore.instance.collection('Medico').snapshots();
  static String query='C';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(
          stream: firebaseDB,
          builder: (context, snapshot) {
            if(snapshot.hasData)
            return Container(
//            height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: itemcount,
                          itemBuilder: (context, int index) {

//                            print(Firestore.instance
//                                .collection('Medico')
//                                .where('name',
//                                isGreaterThanOrEqualTo: query,
//                                isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length-1) + 1))
//                                .snapshots().listen((data)=>data.documents.forEach((doc)=>print(doc['name']))));
                            return _DiseaseDetail(snapshot.data, index);
                          }),
                    ),
                    FlatButton(
                      onPressed:(){
                        setState(() {
                          itemcount+=20;
                        });
                      } ,
                      child: Text('More',),
                    )
                  ],
                ),
            );
            else
              return Center(child: CircularProgressIndicator());
          }
      ),);
  }


  _DiseaseDetail(QuerySnapshot snapshot, int index) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: Card(
              child: Center(
                child: ListTile(
                  subtitle: Text('${snapshot.documents[index]['overview'].toString().substring(0,80).replaceAll('[',' ')} ...'),
                  title: Text(snapshot.documents[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:18 ),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>_DiseaseCompleteDetail(snapshot,index)

                    ,));
                  },
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

  _DiseaseCompleteDetail(QuerySnapshot snapshot, int index) {
    return Scaffold(appBar: AppBar( title:Text(snapshot.documents[index]['name'])),
    body: Container(
      child: ListView(
        children: <Widget>[Column(
          children: <Widget>[
            if(snapshot.documents[index]['overview']!='')
              Container(
                  height: 80,
                  width: 400,
                  color: Color(0xFF87E6D5),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Over View',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B))),
                  )),
            if(snapshot.documents[index]['overview']!='')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Text(snapshot.documents[index]['overview'].toString().replaceAll('\n', ' '),style: TextStyle(fontSize: 16),)),
              ),
            if(snapshot.documents[index]['symptoms']!='')
          Container(
            height: 80,
             width: 400,
             color: Color(0xFF87E6D5),
            alignment: Alignment.center,
             child: Padding(
              padding: const EdgeInsets.all(8.0),
               child:   Text('Symptoms',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),)),),
            if(snapshot.documents[index]['symptoms']!='')
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                      child:Text(snapshot.documents[index]['symptoms'].toString().replaceAll('[', ' '),style: TextStyle(fontSize: 16),),
                  )),
            if(snapshot.documents[index]['home_remedies']!='')
    Container(
    height: 80,
    width: 400,
    color: Color(0xFF87E6D5),
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('Home Remedies',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
            if(snapshot.documents[index]['home_remedies']!='')
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                      child:Text(snapshot.documents[index]['home_remedies'].toString(),style: TextStyle(fontSize: 16) ,))),
            if(snapshot.documents[index]['causes']!='')
    Container(
    height: 80,
    width: 400,
    color: Color(0xFF87E6D5),
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child:  Text('Causes',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
            if(snapshot.documents[index]['causes']!='')
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                      child:Text(snapshot.documents[index]['causes'].toString(),style: TextStyle(fontSize: 16)))),
            if(snapshot.documents[index]['treatment']!='')
    Container(
    height: 80,
    width: 400,
    color: Color(0xFF87E6D5),
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child:    Text('Treatment',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Color(0xFF00796B)),))),
            if(snapshot.documents[index]['treatment']!='')
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(

    child:Text(snapshot.documents[index]['treatment'].toString(),style: TextStyle(fontSize: 16),))),


          ],
        ),],
      ),

    ),


    );

  }

}
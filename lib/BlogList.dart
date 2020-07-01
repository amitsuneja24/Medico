import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BlogFetch.dart';
class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
//  void initState() {
//    super.initState();
//    APIService apiService = APIService();
//// You future
//    Future future;
//  }

  @override
  Widget build(BuildContext context) {
    var FireStoreDB= Firestore.instance.collection("Links").snapshots();
    return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
        child: StreamBuilder(
          stream: FireStoreDB,
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData)
                return ListView.builder(itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,int index){return Card(child: Text(snapshot.data.documents[index]['Links'],style: TextStyle(color: Colors.purple),));});
               else
                 return CircularProgressIndicator();
          },
        ),
      ),
            ),
    );
  }

//  _CustomListItemBuilder(AsyncSnapshot<QuerySnapshot> snapshot,int index) {
//    APIService apiService = APIService();
//    Future future =apiService.get(endpoint:'/GET');
//        return future.then((value) => Text());
//
//
//          Text(snapshot.data.documents[index]['Links']);
 // }
}


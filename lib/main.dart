import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'presentation/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<List<DocumentSnapshot>> getFirestoreTest() async{
    QuerySnapshot qshot = await Firestore.instance
        .collection('SampleCollection')
        .getDocuments();

    print(qshot.documents.length);

    return qshot.documents;

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getFirestoreTest();

    return MaterialApp(
        home: HomeScreen());
  }
}

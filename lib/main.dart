import 'package:firebase/realtime.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const firestoreApp());
}

class firestoreApp extends StatelessWidget {
  const firestoreApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var dbNames = <String>[];
  var dbPhone = <String>[];

  void _initDb(String collection) {
    print("size.length : ${dbNames.length}");

    FirebaseFirestore.instance
        .collection(collection)
        .snapshots()
        .listen((event) {
          event.docs.forEach((element) {
            print("name : ${element.data()['name']}");
            print("phoneNumber : ${element.data()['phoneNumber']}");

          });
        });
  } // _initDB

  @override
  Widget build(BuildContext context) {
    _initDb('Test');

    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
        backgroundColor: Color(0xccAA59A5),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '파이어스토어 데이터 확인 로그 찍기',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const realtimeApp()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}

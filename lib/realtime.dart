import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class realtimeApp extends StatelessWidget {
  const realtimeApp({super.key});
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
  int _counter = 0;

  void _initDb() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    Future<DataSnapshot> data = ref.get();
    data.asStream().forEach((element) {
      print( "element : ${element.value} ");
    });
  }

  @override
  Widget build(BuildContext context) {
    _initDb();

    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime'),
        backgroundColor: Color(0xff8559A5),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '리얼타임 데이터 확인 로그 찍기',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const firestoreApp()),
          );
        },
        child: Icon(Icons.preview_sharp),
      ),
    );
  }
}

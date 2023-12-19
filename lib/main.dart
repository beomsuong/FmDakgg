import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  List<dynamic> data = [];
  Future<void> addUser(String id, String name) async {
    var url = Uri.parse('http://10.0.2.2:3000/api/users/add');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
      }),
    );
    if (response.statusCode == 200) {
      print('User added: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> readUser() async {
    var url = Uri.parse('http://10.0.2.2:3000/api/users');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('User added: ${response.body}');
      final parsed = jsonDecode(response.body);
      print(parsed['users']);
      data = parsed['users'];
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TextButton(
              onPressed: () async {
                await addUser("4", "23");
              },
              child: const Text('유저 추가'),
            ),
            TextButton(
              onPressed: () async {
                await readUser();
              },
              child: const Text('조회'),
            ),
            for (var datas in data)
              Row(
                children: [
                  Text(
                    datas['id'].toString(),
                  ),
                  Text(
                    datas['name'].toString(),
                  )
                ],
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          addUser;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main (){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final name = user['name']['first'];
            final email = user['email'];
            final image = user['picture']['thumbnail'];

            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                  child: Image.network(image)),
              title: Text(name.toString()),
              subtitle: Text(email),

            );
          }),

      floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers),
    );
  }
  Future <void> fetchUsers() async {
    print('fetchUsers called');

    final response = await http.get(
      Uri.parse('https://randomuser.me/api/?results=5'),
      );

      final data = jsonDecode(response.body);

      setState(() {
        users = data['results'];
      });
      // print(data['results']['0']);

      print('fetchUsers Completed');
  }

}


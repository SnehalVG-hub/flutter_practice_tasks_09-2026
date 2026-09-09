```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// ==================================================
// MY APP
// ==================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // API TEST SCREEN
      home: const HomeScreen(),
    );
  }
}

// ==================================================
// REST API TEST SCREEN
// ==================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Stores users received from API
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Call'),
      ),

      // ==================================================
      // DISPLAY USERS
      // ==================================================

      body: ListView.builder(
        itemCount: users.length,

        itemBuilder: (context, index) {
          final user = users[index];

          final name = user['name']['first'];
          final email = user['email'];
          final image = user['picture']['thumbnail'];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),

              child: Image.network(image),
            ),

            title: Text(name.toString()),

            subtitle: Text(email),
          );
        },
      ),

      // ==================================================
      // API BUTTON
      // ==================================================

      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,

        child: const Icon(Icons.download),
      ),
    );
  }

  // ==================================================
  // FETCH USERS FROM API
  // ==================================================

  Future<void> fetchUsers() async {
    print('fetchUsers called');

    final response = await http.get(
      Uri.parse(
        'https://randomuser.me/api/?results=5',
      ),
    );

    final data = jsonDecode(response.body);

    setState(() {
      users = data['results'];
    });

    print('fetchUsers completed');
  }
}


// ==================================================
// BOTTOM NAVIGATION CODE
// CURRENTLY COMMENTED OUT
// ==================================================


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }


// class _HomePageState extends State<HomePage> {

//   int currentPage = 0;

//   final List<Widget> pages = [
//     const HomeScreen(),
//     const FavouritePage(),
//     const ProfPage(),
//   ];


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: pages[currentPage],


//       bottomNavigationBar: BottomNavigationBar(

//         currentIndex: currentPage,


//         onTap: (index) {

//           setState(() {

//             currentPage = index;

//           });

//         },


//         items: const [

//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),


//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favourite',
//           ),


//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),

//         ],
//       ),
//     );
//   }
// }


// ==================================================
// FAVOURITE PAGE
// COMMENTED OUT
// ==================================================


// class FavouritePage extends StatelessWidget {

//   const FavouritePage({super.key});


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(
//         title: const Text('Favourite Page'),
//       ),


//       body: const Center(
//         child: Text('My Favorite Things 💕'),
//       ),
//     );
//   }
// }


// ==================================================
// PROFILE PAGE
// COMMENTED OUT
// ==================================================


// class ProfPage extends StatelessWidget {

//   const ProfPage({super.key});


//   @override
//   Widget build(BuildContext context) {

//     return const Center(
//       child: Text('Profile Page'),
//     );

//   }
// }
```

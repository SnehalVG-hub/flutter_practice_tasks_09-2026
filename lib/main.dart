import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'dart:convert';

void main (){
  runApp(const MyApp());
}
=======


void main() {
  runApp(const MyApp());
}

>>>>>>> 9fa4f7471e2ab3d4e8a50547ae99acda04e6f8f5
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
///////////////////////////////

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
>>>>>>> 9fa4f7471e2ab3d4e8a50547ae99acda04e6f8f5

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
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

=======
        title: Text('My App'),
      ),

       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CircleAvatar(),
                 CircleAvatar(),
                 CircleAvatar(),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 CircleAvatar(),
                 CircleAvatar(),

               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CircleAvatar(),
                 CircleAvatar(),
                 CircleAvatar(),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 CircleAvatar(),
                 CircleAvatar(),

               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CircleAvatar(),
                 CircleAvatar(),
                 CircleAvatar(),
               ],
             ),
           ],
         ),
       )
    );
  }
}

//////////////////////////////

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  List<Widget> pages = [
    HomeContent(),
    FavouritePage(),
    ProfPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,

        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

////////////////////////

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Page'),
      ),

      body: const Center(
        child: Text('My Favorite Things 💕'),
      ),
    );
  }
}

///////////////////////////////

class ProfPage extends StatelessWidget {
  const ProfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}








>>>>>>> 9fa4f7471e2ab3d4e8a50547ae99acda04e6f8f5

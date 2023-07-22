import 'package:chatx/Add_Post.dart';
import 'package:chatx/Chat_Screen.dart';
import 'package:chatx/Settings_Screen.dart';
import 'package:chatx/Users_Screen.dart';
import 'package:chatx/Home_Screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int x = 0;
  var titles =[
    'Home',
    'Chats',
    '',
    'Users',
    'Settings',
  ];
  List<Widget> L = [
    HomeScreen(),
    ChatScreen(),
    Container(),
    UserScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            titles[x],
          ),
          actions: [
            Icon(Icons.alarm,color: Colors.purple,size: 25),
            SizedBox(width: 15,),
            Icon(Icons.search,color: Colors.purple,size: 25),
            SizedBox(width: 15,),
          ],
        ),
        body:Scaffold(
          body: L[x],
          backgroundColor: Colors.blueAccent,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blueAccent,
            currentIndex: x,
            elevation: 0,
            onTap: (index){
              if(index == 2){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddPost()));
              }
              else {
                  x = index;
              }
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'Add Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        )
    );
  }
}

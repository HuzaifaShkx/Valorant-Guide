
import 'package:flutter/material.dart';
import 'package:valorant_guide/Screens/agentScreen.dart';
import 'package:valorant_guide/Screens/playerCardScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> screens=[
    AgentScreen(),
    PlayerCardScreen()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(title: Text("User Name"),
      backgroundColor: Colors.redAccent[700],
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: 100,
            child: DrawerHeader(child: Row(children: [
              CircleAvatar(),
              Text("User Name"),
            ],)),
            
          ),
          Expanded(child: ListView(
            children: [
              ListTile(title: Text("About"),),
              ListTile(title: Text("Settings"),),
              ListTile(title: Text("Security"),),
              ListTile(title: Text("Logout"),),
              
            ],
          ))

        ],),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.redAccent[700],
       
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Agents",),
        BottomNavigationBarItem(icon: Icon(Icons.filter_frames_sharp),label: "Player Cards",),
        //BottomNavigationBarItem(icon: Icon(Icons.timeline),label: "Screen 3",),
      ]),
      body: screens[_selectedIndex],
    );
  }
}
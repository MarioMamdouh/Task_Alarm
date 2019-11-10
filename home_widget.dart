import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'Constants.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.black26),
    PlaceholderWidget(Colors.red[100])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            padding: EdgeInsets.only(bottom: 0,left: 0,right: 30,top: 0),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
        title: Text('Alarms'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
         // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Notes'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('locations')
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

}
  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final _images = [
    'assets/images/Image3.jpg',
    'assets/images/Image4.jpeg',
    'assets/images/Image5.jpg',
  ];

  final _names = [
    'Emma Smith',
    'Lily Thomson',
    'Pepper Pots',
  ];

  final _messages = [
    'Hey!',
    'Where are you!',
    'Typing...',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff6fa),
      appBar: AppBar(
        backgroundColor: Color(0xFFfff6fa),
        centerTitle: true,
        title: Text(
          ' Find Flames',
          style: TextStyle(
              color: Color(0xFFFF5F8F), fontFamily: 'Nunito', fontSize: 26),
        ),
        leadingWidth: 95,
        leading: Container(
          padding: EdgeInsets.only(left: 18, top: 5),
          child: Image(
            image: AssetImage('assets/images/Profile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 3),
            height: 30,
            width: 30,
            child: Image.asset(
              'assets/images/Vector.jpg',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 250,
                    child: Container(
                        color: Color(0xFFfff6fa),
                        width: MediaQuery.of(context).size.width,
                        child: profilesListBuilder()),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    height: 350,
                    padding: EdgeInsets.all(20),
                    child: chatSectionBuilder(),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              transform: Matrix4.translationValues(0, 240, -20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 3),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    icon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        // elevation: 30,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFFFF5F8F),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 38),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_search_rounded,
              size: 34,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit_calendar_outlined,
              size: 34,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 32,
            ),
            label: 'Home',
          ),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }

  ListView chatSectionBuilder() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              height: 100,
              // color: Colors.grey,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(
                    _images[index],
                  ),
                  radius: 35,
                ),
                title: Text(
                  _names[index],
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                subtitle: Text(
                  _messages[index],
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontStyle: _messages[index] == 'Typing...'
                        ? FontStyle.italic
                        : FontStyle.normal,
                    color: _messages[index] == 'Typing...'
                        ? Color(0xFFFF5F8F)
                        : Colors.black54,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '1:05',
                      style: TextStyle(fontFamily: 'Nunito'),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFFFF5F8F),
                      radius: 10,
                      child: Text(
                        '3',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 10),
                      ),
                    )
                  ],
                ),
              ));
        }));
  }

  ListView profilesListBuilder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 130,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              transform: Matrix4.translationValues(20, 200, 0),
              child: Text(
                _names[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Nunito', fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      }),
      itemCount: 3,
    );
  }
}

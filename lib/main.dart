// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsApp(),
    );
  }
}

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    Text('Favorite Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Dogecoin to the Moon...',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ],
        ),
        // centerTitle: true,
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Center(),
        // ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(
                      'Latest News',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    personDetails(),
                    personDetails(),
                    personDetails(),
                    personDetails(),
                    personDetails(),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                ///////////////////
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: 'Healthy', isSelected: true),
                    CategoryChip(
                      label: 'Technology',
                    ),
                    CategoryChip(label: 'Finance'),
                    CategoryChip(label: 'Arts'),
                    CategoryChip(label: 'Sports'),
                    CategoryChip(label: 'Medical'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              NewsCard(
                title: '5 things to know about the \'conundrum\' of lupus',
                author: 'Matt Villano',
                date: 'Sunday, 9 May 2021',
                imageUrl: 'assets/Frame 32.png',
              ),
              NewsCard(
                title: '4 ways families can ease anxiety together',
                author: 'Zain Khan',
                date: 'Sunday, 9 May 2021',
                imageUrl: 'assets/Frame 34.png',
              ),
              NewsCard(
                title:
                    'What to consider when planning a wedding during the pandemic',
                author: 'Jane Doe',
                date: 'Sunday, 9 May 2021',
                imageUrl: 'assets/Frame 33.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class personDetails extends StatelessWidget {
  const personDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 345,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/WhatsApp Image 2024-07-14 at 19.22.41_2c7c9d10.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          // Replace with actual image
          Container(
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crypto investors should be prepared to lose all their money, BOE governor says',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'by Ryan Browne\n“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.red : Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String imageUrl;

  NewsCard(
      {required this.title,
      required this.author,
      required this.date,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsetsDirectional.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/WhatsApp Image 2024-07-14 at 19.22.41_2c7c9d10.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'by $author',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

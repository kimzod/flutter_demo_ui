import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

final dummyItems = [
  'https://cdn.pixabay.com/photo/2020/01/09/03/38/london-4751769_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/02/15/09/09/church-4850405_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/03/02/14/54/landscape-4895932_1280.jpg',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _index = 0;

  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('복잡한 UI', style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add, color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('홈'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('이용서비스'),
            icon: Icon(Icons.assessment),
          ),
          BottomNavigationBarItem(
            title: Text('내 정보'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: InkWell(
                onTap: (){
                  print('클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40,),Text('택시')
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시2')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시3')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시4')
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시2')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_taxi, size: 40,),Text('택시3')
              ],
            ),
            Opacity(
              opacity: 0.0,
              child: Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40,),Text('택시4')
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildMiddle(){
    return CarouselSlider(
      height: 150,
      autoPlay: true,
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(borderRadius: BorderRadius.circular(8.0),
                child: Image.network(url, fit: BoxFit.cover,),
                ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom(){
    final items = List.generate(10, (i){
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[공지사항] 여기는 공지사항입니다.'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }

}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '이용 서비스',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
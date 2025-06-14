import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/dartquiz/dquestionscreen.dart';
import 'package:untitled/flutterquiz/flutterquizscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:untitled/pythonquiz/pquestionscreen.dart';
import 'package:untitled/dartquiz/dquestionscreen.dart';
import 'package:untitled/dartquiz/dresultscreen.dart';
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> selectedAnswer=[];
    void chosenanswer(answer){
      selectedAnswer.add(answer);
    }
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        bottomNavigationBar: Theme(
          data: Theme.of(
            context,
          ).copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            items: items,
            backgroundColor: Colors.white,
            height: 60,
            color: Colors.deepPurpleAccent,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                  // Handle home tap
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle settings tap
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: AppBar(
              title: Center(
                child: Text(
                  'Home Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),

              // python quiz block
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,

                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF6A1B9A), // Deep Purple
                                Color(0xFFE1BEE7), //
                              ],
                            ),
                          ),
                          height: 200,
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'Flutter',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 15, height: 60),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'LEVEL 1',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FquizScreen(selectedAnswer: chosenanswer),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Start Quiz',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -90,
                        right: -20,
                        child: Image(
                          image: AssetImage('assets/images/book.png'),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,

                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFE91E63), // Deep pink
                                Color(0xFFF8BBD0), //
                              ],
                            ),
                          ),
                          height: 200,
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'DART',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 15, height: 60),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'LEVEL 2',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => dquizScreen(selectedAnswer: chosenanswer,),));
                                      },
                                      child: Text(
                                        'Start Quiz',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -100,
                        right: -10,
                        child: Image(
                          image: AssetImage('assets/images/aero.png'),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,

                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF0D47A1), // Dark Blue
                                Colors.lightBlueAccent.shade100

                                ///
                              ],
                            ),
                          ),
                          height: 200,
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'Python',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 15, height: 60),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'LEVEL 3',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => pquizScreen(selectedAnswer: chosenanswer,),));
                                      },
                                      child: Text(
                                        'Start Quiz',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -90,
                        right: -10,
                        child: Image(
                          image: AssetImage('assets/images/hotair.png'),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

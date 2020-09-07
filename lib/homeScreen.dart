import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_ui/configuration.dart';
import 'package:pet_ui/screen2.dart';

import 'configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 250;
                              yOffset = 150;
                              scaleFactor = .6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      Text('Location'),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: primaryGreen),
                          Text('Indonesia')
                        ],
                      ),
                    ],
                  ),
                  // Icon(Icons.check_circle),
                  CircleAvatar()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text("Search pet to adopt"),
                  Icon(Icons.settings)
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            height: 50,
                            width: 50,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(categories[index]['name'])
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(),
                  )),
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Align(
                          child: Image.asset('images/pet-cat2.png'),
                        )
                      ],
                    )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 60, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Align(
                        child: Image.asset('images/pet-cat1.png'),
                      )
                    ],
                  )),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

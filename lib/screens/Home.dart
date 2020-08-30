import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_web_demo/providers/CarsProvider.dart';
import 'package:flutter_web_demo/widgets/CarCarousel.dart';
import 'package:flutter_web_demo/widgets/ModelList.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<String> socialIcons = [
  'images/ig.png',
  'images/fb.png',
  'images/twitter.png',
  'images/youtube.png',
];

List<String> cars = [
  'Model S',
  'Model X',
  'Model Y',
  'Model 3',
];

Widget handles() {
  return Container(
    height: 20,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(left: 30),
        height: 20,
        width: 20,
        child: Image.asset(
          socialIcons[index],
          height: 20,
          color: Color.fromRGBO(23, 38, 102, 1),
        ),
      ),
    ),
  );
}

PageController controller = PageController();
bool active = false;
bool tapped = false;

class _MyHomePageState extends State<MyHomePage> {
  CarsProvider get provider {
    return Provider.of<CarsProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/logo.png',
                        height: 30, color: Colors.black),
                    Spacer(),

                    ...List.generate(
                        cars.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                cars[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromRGBO(23, 38, 102, 1)),
                              ),
                            )).toList(),

                    //Center(child: Cars()),
                    Spacer(),
                    Icon(
                      Icons.person,
                      size: 15,
                      color: Color.fromRGBO(23, 38, 102, 1),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.menu,
                      size: 15,
                      color: Color.fromRGBO(23, 38, 102, 1),
                    ),
                  ],
                ),
              ),
              CarCarousel(controller: controller),
              Padding(
                padding: EdgeInsets.only(left: 100, right: 50, bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    handles(),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 50,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(115, 140, 252, 1)
                                .withOpacity(0.3),
                          ),
                          shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 8,
                          color:
                              Color.fromRGBO(115, 140, 252, 1).withOpacity(0.3),
                          onPressed: () {
                            controller.previousPage(
                                duration: Duration(milliseconds: 1100),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(115, 140, 252, 1),
                          ),
                          shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          iconSize: tapped ? 15 : 8,
                          color: Color.fromRGBO(115, 140, 252, 1),
                          onPressed: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 1100),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Designed By Tomisin. 2020',
                      style: TextStyle(color: Color.fromRGBO(23, 38, 102, 1)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Skew extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.height + 0.5, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

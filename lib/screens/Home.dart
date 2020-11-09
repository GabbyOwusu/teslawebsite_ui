import 'package:flutter/material.dart';
import 'package:flutter_web_demo/providers/CarsProvider.dart';
import 'package:flutter_web_demo/widgets/CarCarousel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

PageController controller = PageController();
bool active = false;
bool tapped = false;

class _MyHomePageState extends State<MyHomePage> {
  List<String> _socialIcons = [
    'images/ig.png',
    'images/fb.png',
    'images/twitter.png',
    'images/youtube.png',
  ];

  Widget handles() {
    return Container(
      height: 20,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 30),
              height: 20,
              width: 20,
              child: Image.asset(
                _socialIcons[index],
                height: 20,
                color: Color.fromRGBO(23, 38, 102, 1),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CarsProvider>(context);

    bool selected = false;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1500),
            child: Container(
              child: Image.asset(
                provider.selected.backgroungImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        height: 30,
                        color: Colors.black,
                      ),
                      Spacer(),
                      ...List.generate(
                        provider.cars.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = true;
                              });
                              context.read<CarsProvider>().setCurrentCar(
                                    provider.cars[index],
                                  );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                provider.cars[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: selected
                                      ? Colors.black
                                      : provider.cars[index].color,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
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
                CarCarousel(controller: controller, car: provider.selected),
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
                            color: Color.fromRGBO(115, 140, 252, 1)
                                .withOpacity(0.3),
                            onPressed: () {
                              controller.previousPage(
                                duration: Duration(milliseconds: 1100),
                                curve: Curves.easeInOut,
                              );
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
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            iconSize: tapped ? 15 : 8,
                            color: Color.fromRGBO(115, 140, 252, 1),
                            onPressed: () {
                              controller.nextPage(
                                duration: Duration(milliseconds: 1100),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Designed By Tomisin. 2020',
                        style: TextStyle(
                          color: Color.fromRGBO(23, 38, 102, 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

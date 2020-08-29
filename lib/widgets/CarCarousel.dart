import 'package:flutter/material.dart';

class CarCarousel extends StatefulWidget {
  final PageController controller;

  CarCarousel({@required this.controller});
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

List<String> tesla = [
  'images/tesla1.png',
  'images/tesla2.png',
  'images/tesla3.webp',
  'images/tesla4.png',
  'images/tesla5.png',
];

class _CarCarouselState extends State<CarCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 150, top: 130),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 90.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2020',
                  style: TextStyle(
                      color: Color.fromRGBO(211, 213, 229, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'MODEL S',
                  style: TextStyle(
                      color: Color.fromRGBO(23, 38, 102, 1),
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
                  style: TextStyle(
                      color: Color.fromRGBO(23, 38, 102, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(115, 140, 252, 1),
                            width: 2,
                          ),
                          shape: BoxShape.rectangle),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'Learn More',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(115, 140, 252, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(115, 140, 252, 1),
                      ),
                      child: Center(
                        child: Text(
                          'Order Now',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 500,
              child: PageView.builder(
                controller: widget.controller,
                itemBuilder: (context, index) =>
                    Image.asset(tesla[index], height: 700),
                itemCount: tesla.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
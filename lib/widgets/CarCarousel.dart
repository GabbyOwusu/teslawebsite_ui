import 'package:flutter/material.dart';
import 'package:flutter_web_demo/models/CarsModel.dart';

class CarCarousel extends StatefulWidget {
  final PageController controller;
  final Car car;

  CarCarousel({@required this.controller, @required this.car});
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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
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
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.car.name,
                    style: TextStyle(
                      color: Color.fromRGBO(23, 38, 102, 1),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.car.description,
                    style: TextStyle(
                      color: Color.fromRGBO(23, 38, 102, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CTAButton(
                        text: "Learn More",
                        transparent: true,
                      ),

                      SizedBox(width: 15),
                      //CTA
                      CTAButton(text: "Order Now")
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: PageView.builder(
                    controller: widget.controller,
                    itemCount: tesla.length,
                    itemBuilder: (context, index) {
                      return Image.asset(widget.car.images[index], height: 700);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CTAButton extends StatelessWidget {
  final bool transparent;
  final String text;
  CTAButton({this.transparent = false, this.text});
  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(115, 140, 252, 1);
    return Transform(
      transform: Matrix4.skewX(-0.4),
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          border: transparent ? Border.all(color: color, width: 2.0) : null,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: transparent ? Colors.transparent : color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: transparent ? color : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

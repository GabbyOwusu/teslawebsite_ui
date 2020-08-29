import 'package:flutter/material.dart';

class Cars extends StatefulWidget {
  @override
  _CarsState createState() => _CarsState();
}

bool active = true;

List<String> cars = [
  'Model S',
  'Model X',
  'Model Y',
  'Model 3',
];

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cars.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              active = !active;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 40),
            child: Text(
              cars[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: active
                    ? Color.fromRGBO(23, 38, 102, 1)
                    : Color.fromRGBO(115, 140, 252, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

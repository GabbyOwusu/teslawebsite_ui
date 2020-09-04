import 'package:flutter/material.dart';
import 'package:flutter_web_demo/models/CarsModel.dart';
import 'package:flutter_web_demo/providers/BaseProvider.dart';

class CarsProvider extends BaseProvider {
  Car _selected;

  Car get selected => _selected ?? cars.first;

  List<Car> get cars => _cars;

  void setCurrentCar(Car car) {
    _selected = car;
    notifyListeners();
  }

  List<Car> _cars = [
    Car(
      backgroungImage: 'images/bg1.png',
      color: Color.fromRGBO(23, 38, 102, 1),
      images: [
        'images/tesla1.png',
        'images/tesla3.webp',
        'images/tesla5.png',
        'images/tesla4.png',
        'images/tesla2.png',
      ],
      description:
          'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      name: 'Model S',
    ),
    Car(
      backgroungImage: 'images/bg3.png',
      color: Color.fromRGBO(23, 38, 102, 1),
      images: [
        'images/modely1.png',
        'images/modely2.png',
        'images/modely3.png',
        'images/tesla2.png',
        'images/tesla3.webp',
      ],
      description:
          'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      name: 'Model Y',
    ),
    Car(
      backgroungImage: 'images/bg2.png',
      color: Color.fromRGBO(23, 38, 102, 1),
      images: [
        'images/model33.png',
        'images/model32.png',
        'images/model31.png',
        'images/tesla1.png',
        'images/tesla5.png',
      ],
      description:
          'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      name: 'Model 3',
    ),
    Car(
      backgroungImage: 'images/bg4.png',
      color: Color.fromRGBO(23, 38, 102, 1),
      images: [
        'images/modelx2.png',
        'images/modelx1.png',
        'images/tesla1.png',
        'images/tesla4.png',
        'images/tesla5.png',
      ],
      description:
          'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      name: 'Model X',
    ),
  ];
}

import 'package:flutter_web_demo/models/CarsModel.dart';
import 'package:flutter_web_demo/providers/BaseProvider.dart';

class CarsProvider extends BaseProvider {
  Car selected = Car();

  List<Car> get items {
    return <Car>[
      Car(
        backgroungImage: 'images/bg1.png',
        images: [
          'images/tesla1.png',
          'images/tesla2.png',
          'images/tesla3.webp',
          'images/tesla4.png',
          'images/tesla5.png',
        ],
        description:
            'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
        name: 'Model S',
      ),
      // Car(
      //   backgroungImage: 'images/modely.png',
      //   images: [
      //     'images/tesla1.png',
      //     'images/tesla2.png',
      //     'images/tesla3.webp',
      //     'images/tesla4.png',
      //     'images/tesla5.png',
      //   ],
      //   description:
      //       'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      //   name: 'Model S',
      // ),
      // Car(
      //   backgroungImage: 'images/models.png',
      //   images: [
      //     'images/tesla1.png',
      //     'images/tesla2.png',
      //     'images/tesla3.webp',
      //     'images/tesla4.png',
      //     'images/tesla5.png',
      //   ],
      //   description:
      //       'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      //   name: 'Model S',
      // ),
      // Car(
      //   backgroungImage: 'images/model3.png',
      //   images: [
      //     'images/tesla1.png',
      //     'images/tesla2.png',
      //     'images/tesla3.webp',
      //     'images/tesla4.png',
      //     'images/tesla5.png',
      //   ],
      //   description:
      //       'choosing a model s is a statement. It is a declaration that only the \nabsolute best in quality and performance will do',
      //   name: 'Model S',
      // ),
    ];
  }
}

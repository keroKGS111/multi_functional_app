import 'package:flutter/material.dart';

class SellectionProvider extends ChangeNotifier {
  int? sellectedIndex;
  final List<Map> gifts = [
    {"name": "Lion", "imagePath": "assets/images/animals/lion.png"},
    {"name": "cow", "imagePath": "assets/images/animals/cow.png"},
    {"name": "deer", "imagePath": "assets/images/animals/deer.png"},
    {"name": "giraffe", "imagePath": "assets/images/animals/giraffe.png"},
    {"name": "pingeon", "imagePath": "assets/images/animals/pingeon.png"},
    {"name": "rat", "imagePath": "assets/images/animals/rat.png"},
    {"name": "tiger", "imagePath": "assets/images/animals/tiger.png"},
    {
      "name": "white tiger",
      "imagePath": "assets/images/animals/white-tiger.png",
    },
  ];
  sellectionItem(int index) {
    sellectedIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) {
    return sellectedIndex == index;
  }
}

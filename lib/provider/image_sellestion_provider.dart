import 'package:flutter/material.dart';

class ImageSellestionProvider extends ChangeNotifier {
  List<Map> laptops = [
    {"name": "Mac Book", "image": "assets/images/laptop/labtop1.png"},
    {"name": "HUAWEI", "image": "assets/images/laptop/labtop2.png"},
    {"name": "Hp", "image": "assets/images/laptop/labtop3.png"},
    {"name": "Microsoft", "image": "assets/images/laptop/labtop4.png"},
  ];
  int? sellectionIndex;
}

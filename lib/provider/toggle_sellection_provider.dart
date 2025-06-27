import 'package:flutter/material.dart';

class ToggleSellectionProvider extends ChangeNotifier {
  int followers = 0;
  bool isFollowing = false;

  void toggleFollow() {
    isFollowing = !isFollowing;
    followers += isFollowing ? 1 : -1;
    notifyListeners();
  }
}

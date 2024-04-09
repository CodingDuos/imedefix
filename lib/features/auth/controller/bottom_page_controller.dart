import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomPageController extends StateNotifier<int> {
  BottomPageController() : super(0);

  PageController pageController = PageController(initialPage: 0);

  int state = 0;
  bool onTapped = false;

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 600), curve: Curves.easeIn);
    state++;
  }


  bool isLastPage(int totalScreens) {
    return state >= totalScreens - 1;
  }
}

final bottomPageController =
    StateNotifierProvider<BottomPageController, int>((ref) {
  return BottomPageController();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends StateNotifier<int> {
  OnboardingController() : super(0);

  PageController pageController = PageController(initialPage: 0);

  int state = 0;

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    state++;
  }

  bool isLastPage(int totalScreens) {
    return state >= totalScreens - 1;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, int>((ref) {
  return OnboardingController();
});

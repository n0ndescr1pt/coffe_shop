import 'package:flutter/material.dart';

class ScrollUtils{


//this method scrolling to widget by GlobalKey key
  void scrollToDirection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
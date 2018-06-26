import 'package:flutter/material.dart';
import 'dart:math';

class DotsIndicator extends AnimatedWidget {

  DotsIndicator({
    this.pageController,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white
  }): super(listenable : pageController);


  // The PageController that this DotsIndicator is representing
  final PageController pageController;


  // The number of items managed by the PageController
  final int itemCount;


  // Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The color of the dot. Default is white
  final Color color;


  static const double _dotSize = 4.0;
  static const double _maxZoom = 2.0;
  static const double _dotSpacing = 25.0;

  Widget _buildDot(int index) {
      double selectedNess = Curves.easeOut.transform(
        max(
          0.0, 1.0 - ((pageController.page ?? pageController.initialPage) - index).abs()
        )
      );
      double zoom = 1.0 + (_maxZoom - 1.0) * selectedNess;

      return Container(
        width: _dotSpacing,
        child: Center(
          child: Material(
            color: color,
            type: MaterialType.circle,
            child: Container(
              width: _dotSize * zoom,
              height: _dotSize * zoom,
              child: InkWell(
                onTap: () => onPageSelected(index),
              ),
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, _buildDot),
    );
  }




}

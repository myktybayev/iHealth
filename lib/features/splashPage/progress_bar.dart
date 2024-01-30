import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final double barWidth;

  const ProgressBar({
    Key? key,
    required this.currentPage,
    required this.pageCount,
    required this.barWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Expanded( 
          child: Container(
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: index == currentPage ? const Color(0xFFBBF2EF) : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}
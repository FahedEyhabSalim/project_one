import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  PageViewIndicator({
    required this.isCurrentPage,
    this.marginEnd = 0,
    super.key,
  });

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 18,
      decoration: BoxDecoration(
          color: isCurrentPage ? const Color(0xFF6A90F2) : const Color(0xFFDDDDDD),
          borderRadius: BorderRadius.circular(2)),
    );
  }
}

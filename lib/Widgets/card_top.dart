import 'package:flutter/material.dart';

import '../ui/appstyle.dart';
import '../ui/constants.dart';
import '../utils/sizeconfig.dart';

class CardTop extends StatelessWidget {
  final bool isColor;
  final String text;
  final IconData icon;
  final Widget? page;

  const CardTop(
      {super.key, required this.isColor,
      required this.text,
      required this.icon,
      this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => page ?? const SizedBox(),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (context, animation, _, child) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.easeOut)),
                  child: child,
                );
              })),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            color: isColor ? const Color(0xff1F1E25) : const Color(0xff040305),
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 35),
            const SizedBox(height: 6),
            Text(
              text,
              style: appstyle(
                getProportionateScreenHeight(14),
                kWhiteColor,
                FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

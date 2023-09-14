import 'package:flutter/material.dart';

import '../ui/appstyle.dart';
import '../ui/constants.dart';
import '../utils/sizeconfig.dart';

class CardCustom extends StatelessWidget {
  final String text;
  final String education;
  final String year;
  final Color colorIcon;

  const CardCustom(
      {super.key,
      required this.text,
      required this.colorIcon,
      required this.education,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: const Color(0xff1F1E25),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: colorIcon, borderRadius: BorderRadius.circular(15.0)),
              child:
                  const Icon(Icons.work_outline_outlined, color: Colors.white),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: appstyle(
                    getProportionateScreenWidth(11),
                    kWhiteColor,
                    FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 7.0),
                Text(
                  education,
                  style: appstyle(
                    getProportionateScreenWidth(11),
                    Colors.grey,
                    FontWeight.w500,
                  ),
                ),
                Text(
                
                  year,
                  style: appstyle(
                    getProportionateScreenWidth(11),
                    Colors.grey,
                    FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../ui/appstyle.dart';
import '../ui/constants.dart';
import '../utils/sizeconfig.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: TextFormField(
        maxLines: null,
        style: appstyle(
          getProportionateScreenHeight(12),
          kWhiteColor,
          FontWeight.w500,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: appstyle(
            getProportionateScreenHeight(12),
            kWhiteColor,
            FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: getProportionateScreenWidth(1),
              color: kWhiteColor,
            ),
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: getProportionateScreenWidth(1),
              color: kWhiteColor,
            ),
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: getProportionateScreenWidth(1),
              color: kWhiteColor,
            ),
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(10)),
          ),
        ),
      ),
    );
  }
}

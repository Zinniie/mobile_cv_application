import 'package:flutter/material.dart';
import 'package:mobile_cv_application/ui/constants.dart';

import '../../utils/sizeconfig.dart';
import '../ui/appstyle.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    // required this.btnBorderColor,
  }) : super(key: key);

  final String text;
  final Function press;

  // btnBorderColor

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
        onTap: press as void Function()?,
        child: Container(
          decoration: BoxDecoration(
              color: kPurpleColor,
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(5))),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
                horizontal: getProportionateScreenWidth(16)),
            child: Text(
              text,
              style: appstyle(
                getProportionateScreenWidth(12),
                kWhiteColor,
                FontWeight.w600,
              ),
            ),
          ),
        )
        // child: TextButton(
        //   onPressed: press as void Function()?,
        //   style: TextButton.styleFrom(
        //     backgroundColor: btnColor,
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //   ),
        //   child:
        //       Text(text, style: appstyle(11.sp, textBtnColor, FontWeight.w700)),
        // ),
        );
  }
}

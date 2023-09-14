import 'package:flutter/material.dart';

import '../ui/appstyle.dart';
import '../ui/constants.dart';
import '../utils/sizeconfig.dart';

class Names extends StatelessWidget {
  const Names({
    Key? key,
    required this.name,
    required this.slackName,
    required this.gitHubName,
  }) : super(key: key);

  final String name;
  final String slackName;
  final String gitHubName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Center(
          child: Text(
            name,
            style: appstyle(
              getProportionateScreenWidth(18),
              kWhiteColor,
              FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        ListTile(
          visualDensity: const VisualDensity(vertical: -2),
          title: Text(
            'Slack Name: $slackName',
            style: appstyle(
              getProportionateScreenWidth(13),
              kWhiteColor,
              FontWeight.w500,
            ),
          ),
          trailing: Text(
            'GitHub Handle: $gitHubName',
            style: appstyle(
              getProportionateScreenWidth(13),
              kWhiteColor,
              FontWeight.w500,
            ),
          ),
        ),
        Divider(
          height: getProportionateScreenHeight(2),
          color: kWhiteColor,
          thickness: getProportionateScreenWidth(2),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    );
  }
}

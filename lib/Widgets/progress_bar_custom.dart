import 'package:flutter/material.dart';

// class Skill {
//   final String name;
//   final String percentage;
//   final Color color;
//   final double progressGauge;

//   Skill({
//     required this.name,
//     required this.percentage,
//     required this.color,
//     this.progressGauge = 300,
//   });
// }

class ProgressBarCustom extends StatelessWidget {
  final String skill;
  final String percentage;
  final Color color;

  const ProgressBarCustom({
    super.key,
    required this.skill,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double parsedPercentage = double.tryParse(percentage) ?? 0.0;
    final double progressWidth =
        MediaQuery.of(context).size.width * (parsedPercentage / 100);

    return Container(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              Text('$percentage%',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              Container(
                height: 9,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
              ),
              FractionallySizedBox(
                widthFactor:
                    parsedPercentage / 100, // Adjust width based on percentage
                child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

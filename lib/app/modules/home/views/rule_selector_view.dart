import 'package:algorithm_task/app/modules/common/constants/enums.dart';
import 'package:algorithm_task/app/modules/common/constants/get_rule_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class RuleSelectorView extends GetView<HomeController> {
  const RuleSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: HighlightRule.values.map((rule) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Obx(() {
              final isSelected = controller.currentRule.value == rule;
              return ChoiceChip(
                label: Text(getRuleName(rule)),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) controller.setRule(rule);
                },
                selectedColor: Colors.blueAccent,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              );
            }),
          );
        }).toList(),
      ),
    );
  }
}

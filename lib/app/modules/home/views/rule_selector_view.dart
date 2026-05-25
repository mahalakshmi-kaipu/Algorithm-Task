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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: HighlightRule.values.length,
        itemBuilder: (context, index) {
          final rule = HighlightRule.values[index];
          
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Obx(() {
              final isSelected = controller.currentRule.value == rule;
              return ChoiceChip(
                label: Text(getRuleName(rule)),
                selected: isSelected,
                onSelected: (selected) {
                  controller.setRule(rule);
                },
                showCheckmark: false,
                selectedColor: Colors.blueAccent,
                backgroundColor: Colors.grey[100],
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

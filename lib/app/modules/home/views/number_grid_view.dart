import 'package:algorithm_task/app/modules/common/helpers/responsive_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class NumberGridView extends GetView<HomeController> {
  const NumberGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = isMobile(context);
        final int crossAxisCount = mobile ? 2 : 4;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemCount: controller.numbers.length,
          itemBuilder: (context, index) {
            final number = controller.numbers[index];

            return Obx(() {
              final isHighlighted = controller.isHighlighted(number);
              
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isHighlighted ? Colors.blueAccent : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isHighlighted
                      ? [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : null,
                  border: Border.all(
                    color: isHighlighted ? Colors.blueAccent : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: TextStyle(
                      fontSize: mobile ? 24 : 18,
                      fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
                      color: isHighlighted ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}

// for responsive UI :
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isMobile(BuildContext context) {
  return Get.width > 0 &&
      Get.width < 900;
}

bool isTablet(BuildContext context) {
  return Get.width >= 500 &&
      Get.width < 1100;
}

/*bool isPhone(BuildContext context) {
  return ResponsiveWrapper.of(context).isPhone;
}

bool isTablet(BuildContext context) {
  return ResponsiveWrapper.of(context).isTablet;
}*/

bool isDesktop(BuildContext context, {double screenWidth=900, bool useMediaQuery=false}) {
  if(useMediaQuery){
    return MediaQuery.of(context).size.width >= screenWidth;  // todo avoid using this as it keep on rebuilding ui
  }
  else{
    return Get.width>=screenWidth;
  }


}

bool isScreenNotFilled({required ScrollController scrollController}) {
  try {
    final scrollMetrics = scrollController.position;
    final contentHeight = scrollMetrics.extentInside + scrollMetrics.extentAfter;
    final screenHeight = scrollMetrics.viewportDimension;
    return contentHeight <= (screenHeight + 300);
  } catch (_) {
    return false;
  }
}


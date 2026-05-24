import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/common_controller.dart';

class CommonView extends GetView<CommonController> {
  const CommonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CommonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

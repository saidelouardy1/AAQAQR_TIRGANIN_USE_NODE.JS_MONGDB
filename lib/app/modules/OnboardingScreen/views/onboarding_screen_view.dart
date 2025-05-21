import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboardingScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnboardingScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

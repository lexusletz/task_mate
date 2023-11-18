import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';
import '../theme/typography.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset("assets/images/welcome_task.png"),
              const SizedBox(height: 30),
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome to ",
                          style: AppTypography.headline1,
                        ),
                        TextSpan(
                          text: "Task Mate",
                          style: AppTypography.headline1.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Welcome to our task list app, your perfect companion for daily organization! Simplify your life, keep your tasks in check, and reach your goals effortlessly. Sign in now and experience efficient task management at your fingertips!",
                      style: AppTypography.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  controller.signIn();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        "Sign in with Google",
                        style: AppTypography.button,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

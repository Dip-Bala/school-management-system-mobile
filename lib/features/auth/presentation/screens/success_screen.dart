import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const SuccessScreen({
    super.key,
    this.title = 'Congratulations',
    this.message = 'Your password has been reset successfully!',
    this.buttonText = 'Log In',
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(76, 175, 80, 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(height: AppConstants.paddingXLarge),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColors.success,
                    ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),

              // Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: AppConstants.paddingXLarge),

              // Button
              CustomButton(
                text: buttonText,
                onPressed: onButtonPressed ??
                    () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteConstants.login,
                        (route) => false,
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

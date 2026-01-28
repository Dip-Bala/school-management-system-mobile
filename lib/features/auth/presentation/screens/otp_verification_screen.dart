import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/widgets/custom_button.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String emailOrPhone;
  
  const OTPVerificationScreen({
    super.key,
    required this.emailOrPhone,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _otpController = TextEditingController();
  bool _isLoading = false;
  String _currentOTP = '';

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _handleVerifyOTP() async {
    if (_currentOTP.length == 6) {
      setState(() => _isLoading = true);
      
      // Simulate OTP verification
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isLoading = false);
      
      if (mounted) {
        Navigator.of(context).pushNamed(RouteConstants.setNewPassword);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter complete OTP')),
      );
    }
  }

  Future<void> _handleResendOTP() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP sent successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppConstants.paddingLarge),

              // Title
              Text(
                'OTP Verification',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                'Enter the 6-digit code sent to your email / phone',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                widget.emailOrPhone,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppConstants.paddingXLarge),

              // OTP Input
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: _otpController,
                onChanged: (value) {
                  setState(() {
                    _currentOTP = value;
                  });
                },
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                  fieldHeight: 56,
                  fieldWidth: 50,
                  activeFillColor: AppColors.white,
                  inactiveFillColor: AppColors.lightGrey,
                  selectedFillColor: AppColors.white,
                  activeColor: AppColors.primaryPurple,
                  inactiveColor: Colors.transparent,
                  selectedColor: AppColors.primaryPurple,
                ),
                cursorColor: AppColors.primaryPurple,
                animationDuration: AppConstants.shortAnimation,
                enableActiveFill: true,
                beforeTextPaste: (text) {
                  return true;
                },
              ),
              const SizedBox(height: AppConstants.paddingLarge),

              // Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive OTP? ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: _handleResendOTP,
                    child: Text(
                      'Resend OTP',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryPurple,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingXLarge),

              // Verify Button
              CustomButton(
                text: 'Verify & Continue',
                onPressed: _handleVerifyOTP,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

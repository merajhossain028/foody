import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimaryColor,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kPrimaryColor,
      onSend: (String value) {
        print('Phone number: $value');
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}

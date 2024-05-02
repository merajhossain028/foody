import 'package:flutter/material.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Container(
          height: 130,
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerrContent: Container(),
        ),
      ),
    );
  }
}

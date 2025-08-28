import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset("assets/avatar.png", width: screenWidth),
          ),
          SizedBox(height: 30.0),
          //intro text
          const Text(
            "Hi, \nI'm Ilham Abdul Hakim\nA Front-End Developer",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          //button
          SizedBox(
            width: 190,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
                foregroundColor: CustomColor.whitePrimary,
              ),
              onPressed: () {},
              child: const Text('Get in Touch'),
            ),
          ),
        ],
      ),
    );
  }
}

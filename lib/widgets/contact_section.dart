import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_link.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // Titile
          Text(
            "Get In Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinWdithDesktop) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextfield(hintText: "Your Messages", maxLine: 20),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                ),
                onPressed: () {},
                child: Text(
                  "Get In Touch",
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Divider(),
          ),
          const SizedBox(height: 15),
          // SNS Icon
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.github]);
                },
                child: Image.asset("assets/git.png", width: 30, height: 30),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.linkedin]);
                },
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 30,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.instagram]);
                },
                child: Image.asset(
                  "assets/instagram.png",
                  width: 30,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.facebook]);
                },
                child: Image.asset(
                  "assets/facebook.png",
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(child: CustomTextfield(hintText: "Your Name")),
        const SizedBox(width: 15),
        Flexible(child: CustomTextfield(hintText: "Your Email")),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(child: CustomTextfield(hintText: "Your Name")),
        const SizedBox(height: 15),
        Flexible(child: CustomTextfield(hintText: "Your Email")),
      ],
    );
  }
}

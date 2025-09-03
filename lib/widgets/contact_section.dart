import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_link.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  // Controller untuk input field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    // Jangan lupa dispose biar gak memory leak
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // Title
          Text(
            "Get In Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 35),

          // Name + Email
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 120),
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

          // Message
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextfield(
              controller: messageController,
              hintText: "Your Messages",
              maxLine: 15,
            ),
          ),
          const SizedBox(height: 15),

          // Button
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                ),
                onPressed: () {
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final message = messageController.text.trim();

                  if (name.isEmpty || email.isEmpty || message.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Harap isi semua field!")),
                    );
                    return;
                  }

                  final subject = Uri.encodeComponent(
                    "Contact from Portfolio Website",
                  );
                  final body = Uri.encodeComponent(
                    "Name: $name\nEmail: $email\nMessage: $message",
                  );

                  final mailtoLink =
                      "mailto:ilhamabdulhakim2000@gmail.com?subject=$subject&body=$body";

                  try {
                    js.context.callMethod("open", [mailtoLink]);

                    // Snackbar sukses
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Pesan siap dikirim melalui email ✉️"),
                      ),
                    );

                    // Clear semua field
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Gagal membuka email client ❌"),
                      ),
                    );
                  }
                },
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
            child: const Divider(),
          ),
          const SizedBox(height: 15),

          // SNS Icon
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () => js.context.callMethod('open', [SnsLink.github]),
                child: Image.asset("assets/git.png", width: 30, height: 30),
              ),
              InkWell(
                onTap: () => js.context.callMethod('open', [SnsLink.linkedin]),
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 30,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () => js.context.callMethod('open', [SnsLink.instagram]),
                child: Image.asset(
                  "assets/instagram.png",
                  width: 30,
                  height: 30,
                ),
              ),
              InkWell(
                onTap: () => js.context.callMethod('open', [SnsLink.facebook]),
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
        Flexible(
          child: CustomTextfield(
            controller: nameController,
            hintText: "Your Name",
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: CustomTextfield(
            controller: emailController,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextfield(controller: nameController, hintText: "Your Name"),
        const SizedBox(height: 15),
        CustomTextfield(controller: emailController, hintText: "Your Email"),
      ],
    );
  }
}

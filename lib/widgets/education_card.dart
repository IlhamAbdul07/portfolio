import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/education_utils.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // breakpoint sederhana
        if (constraints.maxWidth >= 600) {
          return buildDesktopLayout();
        } else {
          return buildMobileLayout();
        }
      },
    );
  }

  Widget buildDesktopLayout() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < myEducationUtils.length; i++)
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      myEducationUtils[i].image,
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(width: 20),
                    Expanded(child: buildTextContent(i)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < myEducationUtils.length; i++)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    myEducationUtils[i].image,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 12),
                  buildTextContent(i),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget buildTextContent(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          myEducationUtils[i].title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          myEducationUtils[i].subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: CustomColor.bgLight1,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            myEducationUtils[i].date,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/education_utils.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({super.key, required this.certificate});
  final CertificateUtils certificate;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 350,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            certificate.image,
            height: 150,
            width: 350,
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(12, 12, 12, 12),
            child: Text(
              certificate.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //subtitle
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(12, 0, 12, 12),
            child: Text(
              certificate.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

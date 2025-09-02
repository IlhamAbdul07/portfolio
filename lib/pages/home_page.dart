import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/utils/education_utils.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/certificate_card.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/education_card.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
// import 'package:my_portfolio/constants/nav_items.dart';
// import 'package:my_portfolio/styles/style.dart';
// import 'package:my_portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.width;
    return LayoutBuilder(
      builder: (context, Constraints) {
        return Scaffold(
          key: ScaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: Constraints.maxWidth >= kMinWdithDesktop
              ? null
              : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //MAIN
              if (Constraints.maxWidth >= kMinWdithDesktop)
                const HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    ScaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (Constraints.maxWidth >= kMinWdithDesktop)
                const MainDesktop()
              else
                const MainMobile(),

              //SKILLS
              Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Title
                    const Text(
                      "What I can do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    if (Constraints.maxWidth >= kMedWdithDesktop)
                      SkillsDesktop()
                    else
                      SkillsMobile(),
                  ],
                ),
              ),
              //PROJETCS
              Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
                child: Column(
                  children: [
                    //Title
                    const Text(
                      "My Projects",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),

                    //Projects Card
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1000),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for (int i = 0; i < myProjectUtils.length; i++)
                            ProjectCardWidget(project: myProjectUtils[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //EDUCATION AND CERTIFICATION
              Container(
                padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
                width: screenWidth,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    //Title
                    const Text(
                      "My Certification",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),

                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1500),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for (int i = 0; i < myCertificateUtils.length; i++)
                            CertificateCard(certificate: myCertificateUtils[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //EDUCATION
              Container(
                padding: const EdgeInsets.fromLTRB(24, 20, 25, 60),
                width: screenWidth,
                child: Column(
                  children: [
                    //Title
                    const Text(
                      "Education",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 25),

                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 2500),
                      child: EducationCard(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              // Contact Section
              ContactSection(),
            ],
          ),
        );
      },
    );
  }
}

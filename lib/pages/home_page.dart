import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/utils/education_utils.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/certificate_card.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/education_card.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(6, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, Constraints) {
        return Scaffold(
          key: ScaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: Constraints.maxWidth >= kMinWdithDesktop
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    //call function
                    ScaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //MAIN
                SizedBox(key: navbarKeys.first),
                if (Constraints.maxWidth >= kMinWdithDesktop)
                  HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
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
                  key: navbarKeys[1],
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
                  key: navbarKeys[2],
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
                  key: navbarKeys[3],
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
                              CertificateCard(
                                certificate: myCertificateUtils[i],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //EDUCATION
                Container(
                  key: navbarKeys[4],
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
                ContactSection(key: navbarKeys[5]),
                SizedBox(height: 30.0),
                // Footer
                Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

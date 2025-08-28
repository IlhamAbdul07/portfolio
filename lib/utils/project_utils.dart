class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? link1;
  final String? link2;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.link1,
    this.link2,
  });
}

List<ProjectUtils> myProjectUtils = [
  ProjectUtils(
    image: "assets/projects/1.png",
    title: "Sistem ERP SelarashomeId",
    subtitle:
        "This was my final graduation project, Enterprise Resource Planning App for SelarashomeId Employee",
    link1: "https://selarashome.my.id/",
    link2:
        " https://github.com/SelarasHomeId/PW-Frontend-Flutter/releases/download/v2.3.4-development/app-release.apk",
  ),
  ProjectUtils(
    image: "assets/projects/2.png",
    title: "Web Cegah Stunting",
    subtitle:
        "A website for child data registration to detect the probability of stunting and provide handling recommendations using the Naive Bayes algorithm at Puskesmas Bojongsari, Depok.",
    link1:
        "https://ilhamabdul07.github.io/Flutter-CegahStuntingPuskesmasBojongsari/",
  ),
  ProjectUtils(
    image: "assets/projects/3.png",
    title: "Budi Utomo Company Profile",
    subtitle:
        "A company profile website for Yayasan Pendidikan Budi Utomo Depok, showcasing the schools under its foundation.",
    link1: "https://ypbudiutomodepok.sch.id/",
  ),
];

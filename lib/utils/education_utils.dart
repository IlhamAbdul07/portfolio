class EducationUtils {
  final String image;
  final String title;
  final String subtitle;
  final String date;

  EducationUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.date,
  });
}

List<EducationUtils> myEducationUtils = [
  EducationUtils(
    image: "assets/educations/1.png",
    title: "CEP-CCIT Faculty of Engineering University of Indonesia",
    subtitle: "Professional Certificate in Network Admininstrator",
    date: "September 2018 - November 2020",
  ),
  EducationUtils(
    image: "assets/educations/2.png",
    title: "Pamulang University",
    subtitle: "Bachelor of Computer Science, Employee Class Program",
    date: "July 2021 - July 2025",
  ),
];

class CertificateUtils {
  final String image;
  final String title;
  final String subtitle;

  CertificateUtils({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<CertificateUtils> myCertificateUtils = [
  CertificateUtils(
    image: "assets/certificates/1.png",
    title: "Certificate Of Competence",
    subtitle: "Indonesian Profesional Certification Authority Oct 2024",
  ),
  CertificateUtils(
    image: "assets/certificates/2.png",
    title: "Proffesional Certification in Network Administrator",
    subtitle:
        "CEP-CCIT Faculty of Engineering University of Indonesia Nov 2020",
  ),
  CertificateUtils(
    image: "assets/certificates/3.png",
    title: "TOEFL Certification",
    subtitle: "Pamulang University Language Institute Aug 2025",
  ),
  CertificateUtils(
    image: "assets/certificates/4.png",
    title: "Mastering Boostrap CSS Framework",
    subtitle: "Issued by Codepolitan March 2024",
  ),
  CertificateUtils(
    image: "assets/certificates/5.png",
    title: "Mastering Javascript Object Oriented Programming",
    subtitle: "Issued by Codepolitan Oct 2024",
  ),
];

import 'package:flutter/material.dart';

class Feature {
  final String image, title, subtitle;

  Feature({
    required this.title,
    required this.image,
    required this.subtitle,
  });
}

List<Feature> dataFeatures = [
  Feature(
      title: "Version controlling",
      image: "assets/images/1.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
  Feature(
      title: "Persistance Data",
      image: "assets/images/2.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
  Feature(
      title: "Bleeding Edge",
      image: "assets/images/3.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
  Feature(
      title: "Commnication",
      image: "assets/images/4.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
  Feature(
      title: "Mobile Support",
      image: "assets/images/5.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
  Feature(
      title: "Process Tracking",
      image: "assets/images/1.jpg",
      subtitle:
          "Consectetur adipiscing elit duis tristique. Erat nam at lectus urna duis convallis convallis."),
];

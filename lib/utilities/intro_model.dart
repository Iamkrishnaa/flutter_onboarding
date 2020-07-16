import 'package:flutter/material.dart';

class IntroModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String imagePath;

  IntroModel({
    @required this.title,
    @required this.description,
    @required this.imagePath,
    @required this.titleColor,
    @required this.descripColor,
  });
}

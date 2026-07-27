import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final bool isLast;

  OnboardingModel({
    required this.image,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isLast = false,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/projects/pet_companion/ui/pet_homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const PetHomePage());
}

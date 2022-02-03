import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/projects/superheroes/superheroes_app.dart';

import 'projects/superheroes/ui/pet_homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const PetHomePage());
}

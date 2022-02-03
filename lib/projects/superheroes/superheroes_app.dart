import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/projects/instagram_redesign/cubit/pet_cubit.dart';
import 'package:flutter_projects/projects/superheroes/ui/pet_homepage.dart';
import 'package:flutter_projects/projects/superheroes/ui/superhero_slider_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroesApp extends StatelessWidget {
  SuperheroesApp(this.type, {Key? key}) : super(key: key);

  String type;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<PetCubit>(
          create: (BuildContext context) => PetCubit(),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Superheroes App",
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        //-------------------
        // App Bar Theme
        //-------------------
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: GoogleFonts.spartan(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        //-------------------
        // Text Theme
        //-------------------
        textTheme: TextTheme(
          headline2: GoogleFonts.spartan(
            fontWeight: FontWeight.w600,
            letterSpacing: -3,
            height: 0.9,
            fontSize: 64,
          ),
          headline5: GoogleFonts.spartan(
            letterSpacing: -1,
            fontWeight: FontWeight.w500,
          ),
        ).apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
      ),
      home:SuperheroSliderPage(type),
    ),);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/projects/instagram_redesign/cubit/pet_cubit.dart';
import 'package:flutter_projects/projects/superheroes/models/superhero.dart';
import 'package:flutter_projects/projects/superheroes/ui/pet_homepage.dart';
import 'package:flutter_projects/projects/superheroes/ui/superhero_detail_page.dart';
import 'package:flutter_projects/projects/superheroes/ui/widgets/superhero_card.dart';

class SuperheroSliderPage extends StatefulWidget {
  const SuperheroSliderPage({
    Key? key,
  }) : super(key: key);

  @override
  _SuperheroSliderPageState createState() => _SuperheroSliderPageState();
}

class _SuperheroSliderPageState extends State<SuperheroSliderPage> {
  PageController? _pageController;
  late int _index;
  late int _auxIndex;
  double? _percent;
  double? _auxPercent;
  late bool _isScrolling;

  @override
  void initState() {
    _pageController = PageController();
    _index = 0;
    _auxIndex = _index + 1;
    _percent = 0.0;
    _auxPercent = 1.0 - _percent!;
    _isScrolling = false;
    _pageController!.addListener(_pageListener);
    super.initState();
    context.read<PetCubit>().fetchPets();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  //--------------------------
  // Page View Listener
  //--------------------------
  void _pageListener() {
    _index = _pageController!.page!.floor();
    _auxIndex = _index + 1;
    _percent = (_pageController!.page! - _index).abs();
    _auxPercent = 1.0 - _percent!;

    _isScrolling = _pageController!.page! % 1.0 != 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const angleRotate = -pi * .5;
    return Scaffold(
      //---------------
      // App Bar
      //---------------
      appBar: AppBar(
        title: const Text("Pets"),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PetHomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<PetCubit, PetState>(
          builder: (BuildContext context, PetState state) {
        if (state is PetSuccessfulGet) {
          final List<Map<String, dynamic>> pets = state.entries;
          return Stack(
            children: [
              //-----------------------
              // Superhero Cards
              //-----------------------
              AnimatedPositioned(
                duration: kThemeAnimationDuration,
                top: 0,
                bottom: 0,
                right: _isScrolling ? 10 : 0,
                left: _isScrolling ? 10 : 0,
                child: Stack(
                  children: [
                    //----------------
                    // Back Card
                    //----------------
                    Transform.translate(
                      offset: Offset(0, 50 * _auxPercent!),
                      child: PetCard(
                        pet: pets[_auxIndex.clamp(0, pets.length - 1)],
                        factorChange: _auxPercent,
                      ),
                    ),
                    //----------------
                    // Front Card
                    //----------------
                    Transform.translate(
                      offset: Offset(-800 * _percent!, 100 * _percent!),
                      child: Transform.rotate(
                        angle: angleRotate * _percent!,
                        child: PetCard(
                          pet: pets[_index],
                          factorChange: _percent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //-----------------------------------------------------
              // VOID PAGE VIEW
              // This page view is just for using the page controller
              //-----------------------------------------------------
              PageView.builder(
                controller: _pageController,
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _openDetail(context, pets[index]),
                    child: const SizedBox(),
                  );
                },
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellow[800],
            ),
          );
        }
      }),
    );
  }

  void _openDetail(BuildContext context, Map<String, dynamic> pet) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: SuperheroDetailPage(
              pet: pet,
            ),
          );
        },
      ),
    );
  }
}

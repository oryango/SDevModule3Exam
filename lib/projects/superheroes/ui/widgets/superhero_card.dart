import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/superheroes/models/superhero.dart';
import 'package:flutter_projects/projects/superheroes/ui/widgets/pet_image.dart';
import 'package:google_fonts/google_fonts.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
    required this.pet,
    required this.factorChange,
  }) : super(key: key);

  final Map<String, dynamic> pet;
  final double? factorChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * .24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          //--------------------------------------------
          // Color bg with rounded corners
          //--------------------------------------------
          Positioned.fill(
            top: separation,
            child: Hero(
              tag: "${pet["id"]}background",
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF222222),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          //-----------------------------------
          // Superhero image
          //-----------------------------------
          Positioned(
            left: 20,
            right: 20,
            top: separation * factorChange!,
            bottom: size.height * .42,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Transform.scale(
                scale: lerpDouble(1, .4, factorChange!)!,
                child: Hero(
                  tag: pet["photos"]!,
                  child:  ProfilePicture().showProfile(pet,context,"medium"),
                    //Image.network(pet["photos"][0]["large"]),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 100,
            top: size.height * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------------------------
                // Superhero Name
                //----------------------------------
                /*FittedBox(
                  child: Hero(
                    tag: pet["id"],
                    child: Text(
                      pet["breeds"].toString().toLowerCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),*/
                //----------------------------------
                // Superhero Secret Identity Name
                //----------------------------------
                Hero(
                  tag: pet["name"]+pet["id"].toString(),
                  child: Text(
                    pet["name"].toLowerCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(height: 25),
                Text.rich(
                  const TextSpan(
                    text: 'learn more',
                    children:  [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                  style: GoogleFonts.spartan(
                      color: Colors.amber,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/home/home_page.dart';

class PetHomePage extends StatelessWidget {
  const PetHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/pets/dog.jpg'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Text(
                          "Dogs",
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    height: 400,
                    width: 300,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/pets/cat.jpg'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Text(
                          "Cats",
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    height: 400,
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

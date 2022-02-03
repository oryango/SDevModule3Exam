import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/home/home_page.dart';
import 'package:flutter_projects/projects/superheroes/superheroes_app.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                      )),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 30),
                  child: Text(
                    "Looking to adopt? Get Started here",
                    style: TextStyle(
                      fontFamily: 'Abel',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuperheroesApp()),
                          );
                        },
                        child: Card(
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
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuperheroesApp()),
                          );
                        },
                        child: Card(
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Text(
                    "Popular Now",
                    style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Row(
                    children: [
                      Card(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/pet accessories/pet_food.jpg'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 20),
                              child: Text(
                                "Treats",
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/pet accessories/pet_toys.jpg'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 20),
                              child: Text(
                                "Toys",
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/pet accessories/pet_grooming.jpg'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 20),
                              child: Text(
                                "Grooming",
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/pet_companion/ui/widgets/pet_image.dart';
import 'package:google_fonts/google_fonts.dart';


class SuperheroDetailPage extends StatefulWidget {
  const SuperheroDetailPage({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final Map<String, dynamic> pet;

  @override
  _SuperheroDetailPageState createState() => _SuperheroDetailPageState();
}

class _SuperheroDetailPageState extends State<SuperheroDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double> _colorGradientValue;
  late Animation<double> _whiteGradientValue;

  late bool _changeToBlack;
  late bool _enableInfoItems;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
          curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
          parent: _controller!,),
    );

    _whiteGradientValue = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
          curve: const Interval(0.1, 1, curve: Curves.fastOutSlowIn),
          parent: _controller!,),
    );

    _changeToBlack = false;
    _enableInfoItems = false;

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller!.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });

    _controller!.addStatusListener(_statusListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!
      ..removeStatusListener(_statusListener)
      ..dispose();
    super.dispose();
  }

  //----------------------------------------
  // Status Listener
  //----------------------------------------
  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _enableInfoItems = true;
      });
    }
  }

  //-----------------------
  // On Back Button Tap
  //-----------------------
  Future<void> _backButtonTap() async {
    setState(() {
      _enableInfoItems = false;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _changeToBlack = false;
      });
    });
    _controller!.reverse().then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Stack(
        children: [
          //-------------------------
          // Animated Background
          //-------------------------
          Positioned.fill(
              child: Hero(
            tag: "${widget.pet["breeds"]}background",
            child: AnimatedBuilder(
                animation: _controller!,
                builder: (_, __) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          Color(0xFF222222),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          _colorGradientValue.value,
                          _whiteGradientValue.value
                        ],
                      ),
                    ),
                  );
                },),
          ),),
          //----------------------
          // Items Body
          //----------------------
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------------
                // Superhero Image
                //---------------------
                SafeArea(
                  child: Hero(
                    tag: widget.pet["photos"],
                    child: ProfilePicture().showProfile(
                      widget.pet,context,'large',),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //--------------------------
                      // Superhero name
                      //--------------------------
                      Align(
                        heightFactor: .7,
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: Hero(
                            tag: widget.pet["breeds"],
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              style: textTheme.headline2!.copyWith(
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white,),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height/15,
                                  child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amberAccent[400])),
                                    child: Text("Adopt",style: 
                                      textTheme.headline2!.
                                      copyWith(fontSize: 30),
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //---------------------------------------
                          // Superhero Secret Identity Name
                          //---------------------------------------
                          Hero(
                            tag: widget.pet["name"],
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              style: textTheme.headline4!.copyWith(
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white,),
                              child: Text(
                                "meet ${widget.pet["name"].toLowerCase()}!",
                              ),
                            ),
                          ),
                          //--------------------------
                          // Animated Marvel Logo
                          //--------------------------
                          /*TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            tween: Tween(
                              begin: 0,
                              end: _enableInfoItems ? 1.0 : 0.0,
                            ),
                            builder: (context, dynamic value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/img/superheroes/marvel_logo.jpg',
                              height: 35,
                              width: 100,
                            ),
                          )*/
                        ],
                      ),
                      //const Divider(height: 50),
                      //---------------------------------------
                      // Animated Superhero Description
                      //---------------------------------------
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Text(
                            ProfilePicture().getDescription(widget.pet),
                            style: GoogleFonts.spartan(
                              color: Colors.grey[800],
                              height: 1.75,
                            ),
                            maxLines: 5,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Divider(height: 40),
                      //----------------------------------
                      // Section Movies Title
                      //----------------------------------
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                          0,
                          _enableInfoItems ? 0 : 50,
                          0,
                        ),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _enableInfoItems ? 1.0 : 0.0,
                          child: Center(
                            child: Text(
                              'additional information',
                              style: textTheme.headline5!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: 
                      Center(
                        child: Text(ProfilePicture().getBreed(widget.pet),
                        style: textTheme.headline5!
                          .copyWith(color: Colors.grey[800],fontSize: 18),
                    ),
                      ),
                  ),
                ),
                //----------------------------
                // Superhero movies list
                //----------------------------
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 11,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      //---------------------------
                      // Animated Movie Card
                      //---------------------------
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 1000 + (300 * index)),
                        curve: Curves.elasticOut,
                        tween: Tween(
                          begin: 0,
                          end: _enableInfoItems ? 0.0 : 1.0,
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 50 * value),
                            child: Opacity(
                                opacity: 1 - value.clamp(0.0, 1.0),
                                child: child,),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: 180,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: 
                                    MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(ProfilePicture().
                                      getInformation(widget.pet)[index*2],
                                    textAlign: TextAlign.center, 
                                    style: textTheme.headline6!.copyWith(
                                      color: Colors.grey[800],),),
                                    ProfilePicture().
                                      getInformation(widget.pet)[index*2+1]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          //-------------------------
          // Back Button
          //-------------------------
          Positioned(
            left: 20,
            top: 0,
            child: SafeArea(
              child: IconButton(
                onPressed: _backButtonTap,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}

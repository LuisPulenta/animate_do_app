import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/screens/navegacion_screen.dart';
import 'package:animate_do_app/screens/twitter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            duration: const Duration(milliseconds: 3000),
            child: const Text('Animate_do')),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) =>
                          const TwitterScreen()));
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 50,
            duration: const Duration(milliseconds: 3000),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const Pagina1Screen()));
              },
              icon: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 2000),
              duration: const Duration(milliseconds: 1000),
              child: const Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 2000),
              child: const Text('Título',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w200)),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 2000),
              duration: const Duration(milliseconds: 1000),
              child: const Text('Soy un texto pequeño',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200)),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 3000),
              duration: const Duration(milliseconds: 1000),
              child: Container(
                height: 2,
                width: 220,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        duration: const Duration(milliseconds: 3000),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        const NavegacionScreen()));
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}

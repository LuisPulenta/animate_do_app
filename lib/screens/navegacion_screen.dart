import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  const NavegacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: const Center(child: Text('Viva la T!!!')),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

//-------------------- BotonFlotante ----------------------
class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white),
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(
          context,
          listen: false,
        );
        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;

        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

//-------------------- BottomNavigation ----------------------
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(
      context,
      listen: false,
    ).numero;
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone, size: 30),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell, size: 30),
              Positioned(
                top: 0,
                right: 0,
                // child: Icon(
                //   Icons.brightness_1,
                //   size: 8,
                //   color: Colors.redAccent,
                // ),
                child: BounceInDown(
                  from: 20,
                  animate: numero > 0 ? true : false,
                  child: Bounce(
                    controller: (controller) => Provider.of<_NotificationModel>(
                      context,
                    ).bounceController = controller,
                    from: 20,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '$numero',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog, size: 30),
        ),
      ],
    );
  }
}

//--------------------- _NotificationModel -----------------------
class _NotificationModel extends ChangeNotifier {
  int _numero = 0;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  late AnimationController _bounceController;

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
    //notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../widgets/counter_widget.dart';
import '../widgets/image_carousel_widget.dart';

void main() {
  runApp(const FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
          leading: Row(
            children: <Widget>[
              const SizedBox(
                width: 5.0,
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/dash',
                  );
                },
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const CarouselWithIndicatorDemo(),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(54, 48, 98, 1),
                          Color.fromRGBO(77, 76, 125, 1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )),
                  height: 600,
                  width: 500,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Space invaders stickers',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text('cada uno'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const CounterDesign(),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Text(
                            'Descripcion',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            '''¡Lleva a tus dispositivos al espacio con un pack de 3 stickers Space Invaders en tamaño 20x20! 🚀👾 ¡Diviértete personalizando tus chats y decorando tu mundo digital con la icónica nostalgia de los videojuegos!
                            ''',
                            style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            children: <Widget>[
                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height: 70.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: _toggleFavorite,
                                  child: Icon(
                                    _isFavorited
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: const Color.fromRGBO(0, 10, 56, 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ButtonTheme(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                height: 70.0,
                                minWidth: 260.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(0, 10, 56, 1)),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Añadir al carrito',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

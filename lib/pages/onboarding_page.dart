import 'package:pmsn20232/screens/login_screen.dart';
import 'package:pmsn20232/widgets/card_tecno.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "ITCELAYA",
      subtitle:
          "Bienvenido a la aplicacion del instituto tecnologico de celaya",
      image: const AssetImage("assets/img/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardPlanetData(
      title: "Nuestra mascota",
      subtitle:
          "En el tecnologico de celaya nuestra mascota es el lince y todos somos linces.",
      image: const AssetImage("assets/img/img-2.png"),
      backgroundColor: Color.fromARGB(255, 230, 67, 67),
      titleColor: Color.fromARGB(255, 238, 164, 251),
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardPlanetData(
      title: "La carrera",
      subtitle:
          "Y ahora formas parte de la carrera de Sistemas, da siguiente e inicia sesion",
      image: const AssetImage("assets/img/img-3.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      ),
    );
  }
}

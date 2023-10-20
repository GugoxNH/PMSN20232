import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:pmsn20232/assets/global_values.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtConUser = TextEditingController();
  TextEditingController txtConPass = TextEditingController();
  bool isChecked = false;
  bool iniciar = false;
  bool modo = false;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

/*   Future<void> recuerdame(flag) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs != null) await prefs.setBool('recordar', flag);
  } */

  Future<void> recuerdame(flag) async {
    final SharedPreferences _prefs = await prefs;

    setState(() {
      _prefs.setBool('recordar', flag);
    });
  }

  Future<void> iniciar_sesion() async {
    SharedPreferences _prefs = await prefs;
    final currentContext = context;
    if (await _prefs.getBool('recordar') == null)
      iniciar = false;
    else
      iniciar = (await _prefs.getBool('recordar'))!;
    if (await _prefs.getBool('recordar') == null)
      modo = false;
    else
      modo = (await _prefs.getBool('modo'))!;

    GlobalValues.flagTheme.value = modo;

    DayNightSwitcher(
      isDarkModeEnabled: modo,
      onStateChanged: (isDarkModeEnabled) {},
    );

    if (iniciar) {
      Navigator.pushNamed(
        currentContext,
        '/dash',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    iniciar_sesion();
  }

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Introduce el usuario',
      ),
    );

    final txtPass = TextField(
      controller: txtConPass,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Introduce el password',
      ),
    );

    final imgLogo = Container(
      width: 180,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://1000marcas.net/wp-content/uploads/2020/11/Mortal-Kombat-logo.png'))),
    );

    final FloatingActionButton btnEntrar = FloatingActionButton.extended(
        icon: Icon(Icons.login),
        label: Text('Entrar'),
        onPressed: () {
          // Navigator.pushNamed(context, '/dash');
          if (txtConUser.text == '' || txtConPass.text == '') {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title:
                        Text('El correo y la Contraseña son datos necesarios'),
                  );
                });
          } else
            Navigator.pushNamed(context, '/dash');
        });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: .5,
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://e0.pxfuel.com/wallpapers/190/488/desktop-wallpaper-blade-runner-2049-reddit-ideas-blade-runner-blade-runner-2049-blade-runner-blade-phone.jpg'))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              imgLogo,
              Container(
                height: 230,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(
                      height: 10,
                    ),
                    txtPass,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centra los elementos horizontalmente.
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                                recuerdame(isChecked);
                              });
                            },
                          ),
                          const Text(
                            'Recuerdame',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}

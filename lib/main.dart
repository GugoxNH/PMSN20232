import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmsn20232/routes.dart';
import 'package:pmsn20232/screens/fruit_screen.dart';
import 'package:pmsn20232/provider/test_provider.dart';
import 'package:pmsn20232/screens/login_screen.dart';
import 'package:pmsn20232/pages/onboarding_page.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/assets/styles_app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return ChangeNotifierProvider(
            create: (context) => TestProvider(),
            child: MaterialApp(
              home: OnboardingPage(),
              //home: FirstScreen(),
              //home: const Home(),
              //home: LoginScreen(),
              routes: getRoutes(),
              theme: value
                  ? StylesApp.darkTheme(context)
                  : StylesApp.lightTheme(context),
              /* routes: {'/dash': (BuildContext context) => LoginScreen()}, */
            ),
          );
        });
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: [Colors.white, Colors.blue, Colors.red],
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (int index) {
          return Center(
            child: Container(
              child: Text('Page $index'),
            ),
          );
        },
      ),
    );
    ;
  }
}

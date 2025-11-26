import 'package:flutter/material.dart';
import 'package:lab4_mob/screens/home_screen_pro.dart';
import 'package:lab4_mob/screens/signin_pro.dart';
import 'screens/home_screen.dart';
import 'screens/splashscreen.dart';
import 'screens/firstpage.dart';
import 'screens/secondpage.dart';
import 'screens/thirdpage.dart';
import 'screens/signin.dart';
import 'screens/verification.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeHub',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Splashscreen());
          case '/pageone':
            return MaterialPageRoute(builder: (_) => Pageone());
          case '/pagetwo':
            return MaterialPageRoute(builder: (_) => Pagetwo());
          case '/pagethree':
            return MaterialPageRoute(builder: (_) => Pagethree());
          case '/welcome':
            return MaterialPageRoute(builder: (_) => Welcome());
          case '/signin':
            return MaterialPageRoute(builder: (_) => Signin());
          case '/verification':
            return MaterialPageRoute(builder: (_) => Verification());
          case '/homescreen':
            return MaterialPageRoute(builder: (_) => HomeScreen());

          case '/signin_pro':
            return MaterialPageRoute(builder: (_) => SigninPro());  

          case '/home_screen_pro':
            return MaterialPageRoute(builder: (_) => HomeScreenPro());    

          default:
            return MaterialPageRoute(
              builder: (_) =>
                  Scaffold(body: Center(child: Text('404: Page not found'))),
            );
        }
      },
    );
  }
}

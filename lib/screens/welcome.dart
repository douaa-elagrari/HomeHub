import 'package:flutter/material.dart';
import '../widgets/page.dart';
import '../widgets/button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome To HomeHub',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF004E98),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Your all in one platform to build ,\n finish and maintain your home in \n Algeria',
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              Mybutton(
                text: 'Hire a Service',
                bgcolor: Color(0xFF004E98),
                fgcolor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),
              SizedBox(height: 20),
              Mybutton(
                text: 'Provide a Service',
                bgcolor: Colors.white,
                fgcolor: Color(0xFF004E98),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin_pro');
                },
              ),
              SizedBox(height: 200),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5), // default color
                    fontSize: 12,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing you agree to our '),
                    TextSpan(
                      text: 'Terms Services\n',
                      style: const TextStyle(color: Color(0xFF004E98)),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: Color(0xFF004E98)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

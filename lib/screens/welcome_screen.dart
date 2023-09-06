import 'package:flutter/material.dart';
import 'package:flash_chat1/screens/login_screen.dart';
import 'package:flash_chat1/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat1/components/rounded_button.dart';
import 'package:flash_chat1/constants.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1), vsync: this);

    // animation = CurvedAnimation(parent: controller, curve:Curves.easeIn);
      animation = ColorTween(begin:Colors.blueGrey, end: Colors.white).animate(controller);

      controller.forward();


    // animation.addStatusListener((status) {
    //   if ( status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if(status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child:Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                ),
                    TypewriterAnimatedTextKit(
                      text: ['Flash Chat'],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),

            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
          title: 'Log In',
          colour: Colors.lightBlueAccent, onPressed:(){
            Navigator.pushNamed(context, LoginScreen.id);
            },
            ),
            RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent, onPressed:(){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            ),
        ],
       ),
      ),
    );
  }
}

import 'package:bark_buddy/screens/welcomeScreen.dart';
import 'package:bark_buddy/utils/appTextStyles.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 2000),(){
      Navigator
          .of(context)
          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
        return new WelcomeScreen();
      }));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.black,body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(child: Image.asset(Assets.images.logoBackgroundless.path, height: 200,width: 200,color: Colors.white,),),
   
      Text("Bark Buddy", style: AppTextStyles.poppinsSemiBold(color: Colors.white,fontSize: 25,),),
      SizedBox(height: 8,),
      Text("Where Hearts and Homes Find Each Other!", style: AppTextStyles.poppinsMedium(color: Colors.white,fontSize: 14,),
      textAlign: TextAlign.center,)
    ],),);
  }
}

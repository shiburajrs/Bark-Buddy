import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../components/customButton.dart';
import '../components/customTextField.dart';
import '../utils/appTextStyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isLoading = false;

  void _handleButtonClick() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Login with your account to continue",
            style: AppTextStyles.poppinsSemiBold(
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),

          const SizedBox(height: 30,),

          Text(
            "Email",
            style: AppTextStyles.poppinsMedium(
              fontSize: 16.0,
              color: Colors.black.withOpacity(0.4),
            ),
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 15,),

          CustomTextField(hintText: "Email Address",suffixIcon: null),

          const SizedBox(height: 30,),



          Text(
            "Password",
            style: AppTextStyles.poppinsMedium(
              fontSize: 16.0,
              color: Colors.black.withOpacity(0.4),
            ),
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 15,),

          CustomTextField(hintText: "Password",suffixIcon: Icons.visibility),


          const SizedBox(height: 60,),


          CustomButton(
            title: 'Login',
            isLoading: _isLoading,
            onPressed: _handleButtonClick,
          ),



          const SizedBox(height: 15,),


          RichText(
            text: TextSpan(
              text: "If you haven't and account? ",
              style: AppTextStyles.poppinsRegular(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Register',
                  style: AppTextStyles.poppinsRegular(
                    fontSize: 14.0,
                    color: AppColors.primaryBlack,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          )
        ],),
    ),);
  }
}

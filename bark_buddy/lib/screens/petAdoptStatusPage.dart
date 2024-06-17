import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../utils/appColors.dart';
import '../utils/appTextStyles.dart';

class PetAdoptionStatusPage extends StatelessWidget {
  final bool isSuccess;

  PetAdoptionStatusPage({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isSuccess
                  ? Image.asset(Assets.images.petAdoptSuccess.path,
                width: 200,
                height: 200,
              )
                  : Image.asset(
                Assets.images.petAdoptFailure.path,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              isSuccess
                  ? Column(
                children: [
                  Text(
                    'Yay! Thank you for adopting me!',
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),),
                  SizedBox(height: 10),
                  Text(
                    'I promise to be your loyal friend forever!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  Text(
                    'Oh no! Something went wrong',
                    style:  AppTextStyles.poppinsSemiBold(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),),
                  SizedBox(height: 10),
                  Text(
                    'I guess we weren\'t meant to be... Maybe next time?',
                    textAlign: TextAlign.center,
                    style:  AppTextStyles.poppinsRegular(
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Go back to home',
                    style: AppTextStyles.poppinsMedium(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

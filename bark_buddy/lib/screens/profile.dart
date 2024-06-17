import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../gen/assets.gen.dart';
import '../utils/appTextStyles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  Widget myProfile(){
    return  Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,children: [
      const CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage('https://bsmedia.business-standard.com/_media/bs/img/article/2019-04/01/full/1554102256-4108.jpg'), // Replace with user's profile image
      ),

      SizedBox(width: 15,),
      Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsSemiBold(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 5,),

        Text(
          'johndoe@email.com',
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsRegular(
            fontSize: 15.0,
            color: Colors.black.withOpacity(0.6),
          ),
        ),

      ],)
    ],);
  }

  Widget profileContent(VoidCallback onTap, String title, String iconPath,{bool? showBackButton = true} ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryBlack.withOpacity(0.7),
              ),
              child: Center(child: Image.asset(iconPath, height: 25,width: 25,color: Colors.white,)),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            showBackButton == true ? const Icon(Icons.arrow_forward_ios, size: 16) : const SizedBox(),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Profile",
        prefixIcon: null,
        showBackButton: false,
        showPrefixIcon: true,
        onPrefixIconPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20,),child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            myProfile(),

            const SizedBox(height: 30,),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryBlack), child: Center(child: Text("Edit Profile", style: AppTextStyles.poppinsSemiBold(
              fontSize: 15.0,
              color: Colors.white,
            )),),),

            const SizedBox(height: 30,),

            profileContent(() {
            },"Notification Settings", Assets.images.profile.notificationSettings.path),

            profileContent(() {
            },"Adoption Applications", Assets.images.profile.application.path),

            profileContent(() {
            },"Terms & Services", Assets.images.profile.tc.path),

            profileContent(() {
            },"Language", Assets.images.profile.language.path),

            profileContent(() {
              _showLogoutDialog(context);
            },"Logout",Assets.images.profile.signout.path, showBackButton: false),
           //  )
          ],
        ),),
      ),);
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(Assets.images.aloneLogout.path),

                Text('Comeback soon', style: AppTextStyles.poppinsSemiBold(
                  fontSize: 20.0,
                  color: Colors.black,
                ),),
              ],
            ),
          ),
          content: Text('Are you sure you want to logout?', style: AppTextStyles.poppinsMedium(
          fontSize: 15.0,
            color: Colors.black,
          ), textAlign: TextAlign.center,),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 15.0,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                      child: Text(
                        'Logout',
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

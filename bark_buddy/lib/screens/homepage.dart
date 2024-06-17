import 'package:bark_buddy/screens/petDetailpage.dart';
import 'package:bark_buddy/screens/searchpage.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../components/customBorderedTextfield.dart';
import '../gen/assets.gen.dart';
import '../utils/appColors.dart';
import '../utils/appConstants.dart';
import '../utils/appTextStyles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Widget searchField(TextEditingController controller, String hintText){
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:  AppTextStyles.poppinsRegular(
            fontSize: 15.0,
            color: Colors.black.withOpacity(0.4),
            textAlign: TextAlign.center,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        style: AppTextStyles.poppinsMedium(
          fontSize: 15.0,
          color: Colors.black,
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget motivationWidget() {
      return Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Every adoption story begins with a click. Start your journey to unconditional love.",
                style: AppTextStyles.poppinsSemiBold(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(
                Assets.images.image1.path,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
      );
    }

    Widget categoriesList() {
      return SizedBox(
        height: 95,
        child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.lightAccentColors[index % 10],
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Assets.images.image2.path,
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Breed",
                    style: AppTextStyles.poppinsMedium(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              );
            }),
      );
    }

    Widget randomPicks() {
      return GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Stack(
              children:[ GestureDetector(onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetDetailPage(),
                  ),
                );
              },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lightAccentColors[index % 10],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              Assets.images.image1.path,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tommy",
                              style: AppTextStyles.poppinsSemiBold(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.male,
                              color: Colors.black,
                              size: 18,
                            )
                          ],
                        ),
                        Text(
                          "Breed",
                          style: AppTextStyles.poppinsSemiBold(
                            fontSize: 14.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    )),
              ),

               Positioned(right: 10,top: 7,child: Container(
                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   color: Colors.black.withOpacity(0.1),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 child: const Center(
                   child: Icon(
                     Icons.favorite_border,
                     size: 20,
                     color: Colors.black,
                   ),
                 ),
               ),
               )

              ]
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: AppConstants.appName,
        prefixIcon: const Icon(Icons.search),
        showBackButton: false,
        showPrefixIcon: false,
        onPrefixIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: AbsorbPointer(
                    absorbing: true,
                    child:
                        searchField(_searchController, "Type here to search")),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              motivationWidget(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 15,
              ),
              categoriesList(),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Random picks for you",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 25,
              ),
              randomPicks()
            ],
          ),
        ),
      ),
    );
  }
}

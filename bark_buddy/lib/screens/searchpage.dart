import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../components/customBorderedTextfield.dart';
import '../components/filterBottomModalSheet.dart';
import '../gen/assets.gen.dart';
import '../model/dogFilter.dart';
import '../utils/appColors.dart';
import '../utils/appTextStyles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  DogFilter _appliedFilter = DogFilter();

  Widget puppiesList() {
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
              children:[ Container(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Search",
        showBackButton: true,
        showPrefixIcon: false,
        onPrefixIconPressed: () {},
      ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
          CustomBorderedTextField(
            hintText: 'Type here to search',
            prefixIcon: Icons.search,
            suffixIcon: Icons.filter_list,
            onSubmitted: (value) {},
            onSuffixIconPressed: (){
              _showFilterSheet();
            },
          ),


          const SizedBox(
            height: 50,
          ),
          Text(
            "Nearby picks",
            style: AppTextStyles.poppinsMedium(
              fontSize: 17.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 25,
          ),

          puppiesList()

        ],),
      ),
    ),);
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterBottomSheet(
          onFilterApplied: (filter) {
            setState(() {
              _appliedFilter = filter;

            });
          },
        );
      },
    );
  }

}

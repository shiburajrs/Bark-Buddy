import 'dart:math';

import 'package:bark_buddy/screens/adoptionIntrestForm.dart';
import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../utils/appLaunchers.dart';
import '../utils/appTextStyles.dart';

class PetDetailPage extends StatefulWidget {
  const PetDetailPage({Key? key}) : super(key: key);

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  Random random = Random();
  late ScrollController _scrollController;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 10) {
      setState(() {
        _showButton = true;
      });
    } else {
      setState(() {
        _showButton = false;
      });
    }
  }

  final String htmlContent = '''
    <p><strong>Description:</strong> Angel is a loving and affectionate young Golden Retriever looking for her forever home. She has a beautiful golden coat and a friendly disposition that lights up any room. Angel enjoys playing fetch, going for walks, and cuddling up on the couch with her favorite humans.</p>
    <h2>Personality</h2>
    <ul>
      <li><strong>Friendly:</strong> Angel adores meeting new people and gets along well with children and other pets.</li>
      <li><strong>Energetic:</strong> Being young, she has plenty of energy for outdoor adventures and playtime.</li>
      <li><strong>Affectionate:</strong> Angel loves to be showered with attention and will reward you with endless kisses and tail wags.</li>
    </ul>
    ''';


  Widget detailBubble(String head, String value) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: AppColors.lightAccentColors[2],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              head,
              style: AppTextStyles.poppinsSemiBold(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppTextStyles.poppinsRegular(
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://worldanimalfoundation.org/wp-content/uploads/2023/09/adorable-dog-breeds-1024x651.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Angel",
                                style: AppTextStyles.poppinsSemiBold(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Golden Retriever",
                                style:  AppTextStyles.poppinsMedium(
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5),
                          Text(
                            "30 km away",
                            style:  AppTextStyles.poppinsMedium(
                              fontSize: 15.0,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          detailBubble("Age", "1"),
                          detailBubble("Gender", "Female"),
                          detailBubble("Color", "Golden"),
                        ],
                      ),
                      const SizedBox(height: 50),
                       Text(
                        "About",
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 19.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                  Html(
                    data: htmlContent,
                      style: {
                        "h1": Style(
                          fontFamily: 'Poppins',
                          fontSize: FontSize(24.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        "h2": Style(
                          fontFamily: 'Poppins',
                          fontSize:  FontSize(20.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        "p": Style(
                          fontFamily: 'Poppins',
                          fontSize:  FontSize(16.0),
                          color: Colors.black87,
                        ),
                        "li": Style(
                          fontFamily: 'Poppins',
                          fontSize:  FontSize(16.0),
                          color: Colors.black87,
                        ),
                      }
                  ),
                      const SizedBox(height: 40),
                      Text(
                        "Owner Details",
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 19.0,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 25,),

                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,children: [
                        CircleAvatar(radius: 35,backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/01/98/68/53/360_F_198685380_UiiR2lCHgg7raR054Dv9v5cuOYdLCEdX.jpg"),),
                        SizedBox(width: 20,),
                        Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text("Jennifer Lopez",   style: AppTextStyles.poppinsMedium(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),),
                          Text("jenni4211@yahoo.com",   style: AppTextStyles.poppinsMedium(
                            fontSize: 12.0,
                            color: Colors.black.withOpacity(0.6),
                          ),)
                        ],),
                        
                        Spacer(),
                        GestureDetector(onTap: (){
                          UrlLauncherHelper.launchPhone("8086323381");
                        },
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black.withOpacity(0.1)),
                            height: 40,width: 40,child: Center(child: Icon(Icons.call, size: 22,),),),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(onTap: (){
                          UrlLauncherHelper.launchEmail("shiburaj525@gmail.com");
                        },
                          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black.withOpacity(0.1)),
                            height: 40,width: 40,child: Center(child: Icon(Icons.mail, size: 22,),),),
                        ),
                      ],),


                      const SizedBox(height: 100)
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_showButton)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Center(
                child:  GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdoptionInterestFormPage(),
                    ),
                  );
                },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text("Adopt Angel",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 16.0,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

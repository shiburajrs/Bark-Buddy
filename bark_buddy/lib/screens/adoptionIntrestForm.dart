import 'package:bark_buddy/screens/fullScreenLoading.dart';
import 'package:bark_buddy/screens/petAdoptStatusPage.dart';
import 'package:bark_buddy/utils/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:bark_buddy/utils/appColors.dart';
import 'package:bark_buddy/utils/appTextStyles.dart';

import '../components/customAppBar.dart';
import '../components/squareLoader.dart';

class AdoptionInterestFormPage extends StatefulWidget {
  @override
  _AdoptionInterestFormPageState createState() => _AdoptionInterestFormPageState();
}

class _AdoptionInterestFormPageState extends State<AdoptionInterestFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _residenceType;
  String? _hasOtherPets;
  String? _experience;
  String? _adoptionMotivation;

  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  void _loadData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetAdoptionStatusPage(isSuccess: true),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
      title: AppConstants.adoptionInterestFormTitle,
      showBackButton: true,
      showPrefixIcon: false,
      onPrefixIconPressed: () {},
    ),
      body: SingleChildScrollView(controller: _scrollController,
        physics: _isLoading ? const NeverScrollableScrollPhysics() : ScrollPhysics(),
        child: Stack(
          children:[ Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text(AppConstants.formDescription,style:  AppTextStyles.poppinsRegular(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),),
                  const SizedBox(height: 20),
                  _buildTextField(_nameController, 'Full Name', TextInputType.text),
                  const SizedBox(height: 20),
                  _buildTextField(_emailController, 'Email', TextInputType.emailAddress),
                  const SizedBox(height: 20),
                  _buildTextField(_phoneController, 'Phone Number', TextInputType.phone),
                  const SizedBox(height: 20),
                  _buildDropdown('Type of Residence', ['Apartment', 'House', 'Condo'], (value) {
                    setState(() {
                      _residenceType = value;
                    });
                  }),
                  const SizedBox(height: 20),
                  _buildDropdown(AppConstants.questionOtherPets, ['Yes', 'No'], (value) {
                    setState(() {
                      _hasOtherPets = value;
                    });
                  }),
                  const SizedBox(height: 20),
                  _buildDropdown(AppConstants.questionExperienceWithPets, ['Beginner', 'Intermediate', 'Experienced'], (value) {
                    setState(() {
                      _experience = value;
                    });
                  }),
                  const SizedBox(height: 20),
                  _buildTextField(
                    TextEditingController(),
                    AppConstants.questionWhyAdopt,
                    TextInputType.text,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   // Process the form submission
                        // }
                        _scrollToTop();
                        _loadData();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlack,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        AppConstants.submitButtonLabel,
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

            if(_isLoading)Container(height: MediaQuery.of(context).size.height, width:  MediaQuery.of(context).size.width,color: Colors.black.withOpacity(0.4),
            child:  Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SequentialSquaresLoader(
                  size: 100,
                  color: Colors.white,
                  duration: Duration(milliseconds: 1200),
                ),
              ],),),)

          ]
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, TextInputType keyboardType, {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.poppinsRegular(
          fontSize: 14.0,
          color: Colors.black.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primaryBlack),
        ),
      ),
      style: AppTextStyles.poppinsSemiBold(
        fontSize: 16.0,
        color: Colors.black,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }

  Widget _buildDropdown(String label, List<String> options, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.poppinsRegular(
          fontSize: 14.0,
          color: Colors.black.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primaryBlack),
        ),
      ),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}

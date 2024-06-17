// filter_bottom_sheet.dart
import 'package:flutter/material.dart';

import '../model/dogFilter.dart';
import '../utils/appTextStyles.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(DogFilter) onFilterApplied;

  const FilterBottomSheet({Key? key, required this.onFilterApplied}) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {

  String? _selectedBreed;
  String? _selectedAge;
  String? _selectedLocation;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Apply Filters',
                style: AppTextStyles.poppinsBold(
                  fontSize: 18.0,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(dropdownColor: Colors.white,
                value: _selectedBreed,
                onChanged: (value) {
                  setState(() {
                    _selectedBreed = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Breed', labelStyle: AppTextStyles.poppinsMedium(
                    fontSize: 14.0,
                    color: Colors.grey
                )),
                items: ['Labrador', 'Poodle', 'German Shepherd']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppTextStyles.poppinsBold(
                        fontSize: 14.0,
                        color: Colors.black
                    ),),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(dropdownColor: Colors.white,
                value: _selectedAge,
                onChanged: (value) {
                  setState(() {
                    _selectedAge = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Age', labelStyle: AppTextStyles.poppinsMedium(
                    fontSize: 14.0,
                    color: Colors.grey
                )),
                items: ['0 - 1 years', '1 - 3 years', '3- 5 years']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: AppTextStyles.poppinsBold(
                        fontSize: 14.0,
                        color: Colors.black
                    )),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(dropdownColor: Colors.white,
                value: _selectedLocation,
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Location', labelStyle: AppTextStyles.poppinsMedium(
                    fontSize: 14.0,
                    color: Colors.grey
                )),
                items: ['New York', 'Los Angeles', 'Chicago']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppTextStyles.poppinsBold(
                        fontSize: 14.0,
                        color: Colors.black
                    )),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(dropdownColor: Colors.white,
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration:  InputDecoration(labelText: 'Gender', labelStyle: AppTextStyles.poppinsMedium(
                  fontSize: 14.0,
                  color: Colors.grey
                )),
                items: ['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppTextStyles.poppinsBold(
                        fontSize: 14.0,
                        color: Colors.black
                    )),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              GestureDetector(onTap: (){
                DogFilter filter = DogFilter(
                  breed: _selectedBreed,
                  age: _selectedAge,
                  location: _selectedLocation,
                  gender: _selectedGender,
                );
                widget.onFilterApplied(filter);
                Navigator.pop(context);
              },
                child: Container(padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black),
                  child: Center(
                    child: Text('Apply',style: AppTextStyles.poppinsBold(
                      fontSize: 16.0,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),),
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

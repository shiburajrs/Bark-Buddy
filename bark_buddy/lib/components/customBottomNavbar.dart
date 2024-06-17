import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../utils/appTextStyles.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final List<NavItem> navItems;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    required this.initialIndex,
    required this.navItems,
    required this.onItemSelected,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.9),
            //blurRadius: 6,
           // offset: Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.navItems.length, (index) {
          NavItem navItem = widget.navItems[index];
          bool isSelected = index == _selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onItemSelected(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(isSelected ? navItem.selectedIcon : navItem.deselectedIcon,height: 22,width: 22, fit: BoxFit.cover,
                color: Colors.black ),
                 const SizedBox(height: 5),
                Text(
                  navItem.label,
                  style: AppTextStyles.poppinsSemiBold(
                      fontSize: 12.0,
                      color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class NavItem {
  final String selectedIcon;
  final String deselectedIcon;
  final String label;

  NavItem({required this.selectedIcon, required this.deselectedIcon, required this.label});
}
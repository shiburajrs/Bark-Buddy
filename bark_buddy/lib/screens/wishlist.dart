
import 'package:bark_buddy/services/dataRepository/mockDataRepository.dart';
import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../gen/assets.gen.dart';
import '../model/wishlisModel.dart';
import '../utils/appSnackbars.dart';
import '../utils/appTextStyles.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late bool _isDisposed = false;
  late List<WishlistModel> _wishlistItems;
  int currentIndex = 0;

  List usageImage = [Assets.images.swipeAddCart.path, Assets.images.swipeDelete.path];

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _wishlistItems = MockDataRepository.mockWishlistData.map((data) => WishlistModel.fromJson(data)).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isDisposed) {
        //_showAlertDialog(context);
      }
    });
  }

  void _removeFromWishlist(int index) {
    setState(() {
      _wishlistItems.removeAt(index);
    });
  }

  void _addToCart(int index) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Wishlist",
        prefixIcon: null,
        showBackButton: false,
        showPrefixIcon: true,
        onPrefixIconPressed: () {},
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _wishlistItems.length,
        itemBuilder: (context, index) {
          final pet = _wishlistItems[index];

          return Dismissible(
            key: Key(pet.petName),
            direction: DismissDirection.horizontal,
            background: _buildSwipeBackground(Assets.images.wishlist.delete.path, Colors.redAccent, false), // Swipe right (delete)
            secondaryBackground: _buildSwipeBackground(Assets.images.wishlist.cart.path, Colors.green, true), // Swipe left (add to cart)
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {

                _addToCart(index);
                CustomSnackBar.showSuccess(context, "${pet.petName} is looking forward to going home with you! 🐶");
              } else if (direction == DismissDirection.startToEnd) {
                _removeFromWishlist(index);
                CustomSnackBar.showError(context, "${pet.petName} is sad to leave your wishlist 😢");
              }
              return false;
            },
            child: _buildWishlistItem(pet),
          );
        },
      ),
    );
  }

  Widget _buildSwipeBackground(String icon, Color color, bool isStart) {
    final alignment = isStart ? Alignment.centerLeft : Alignment.centerRight;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: color,
      child: Row(
        mainAxisAlignment: !isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
        Image.asset(icon, height: 25,width: 25,color: Colors.white,),
          const SizedBox(width: 16),
          Align(alignment: alignment,
            child: Text(
              isStart ? 'Add to Cart' : 'Delete',
              style:  AppTextStyles.poppinsSemiBold(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistItem(WishlistModel pet) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.images.image1.path,
                width: 120,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.petName,
                  style: AppTextStyles.poppinsSemiBold(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  pet.breed,
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),
                Text(
                  pet.price.toString(),
                  style: AppTextStyles.poppinsBold(
                    fontSize: 16.0,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.white,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image display
                Expanded(
                  child: Image.asset(height: 90,
                    usageImage[currentIndex],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Swipe left',
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // Navigation arrows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          currentIndex = (currentIndex - 1).clamp(0, usageImage.length - 1);
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        setState(() {
                          currentIndex = (currentIndex + 1).clamp(0, usageImage.length - 1);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text('Close',style: AppTextStyles.poppinsRegular(
                fontSize: 18.0,
                color:AppColors.primaryBlack,
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

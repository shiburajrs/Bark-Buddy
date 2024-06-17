import 'package:flutter/material.dart';
import 'package:bark_buddy/utils/appTextStyles.dart';

class FullScreenLoading extends StatelessWidget {
  final String loadingMessage;

  const FullScreenLoading({super.key, this.loadingMessage = "Loading..."});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              loadingMessage,
              style: AppTextStyles.poppinsRegular(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'contants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          // Background with blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color:
                    Colors.black.withOpacity(0.1), // Adjust opacity as needed
              ),
            ),
          ),
          // Centered circular progress indicator
          Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                color: red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(String message, BuildContext ctx) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(message,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    backgroundColor: redTitle,
  ));
}

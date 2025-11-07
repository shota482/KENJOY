import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class MapReviewPage extends StatelessWidget {
  const MapReviewPage({super.key});

  static const path = '/map/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapReview'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/japan_map.svg',
              semanticsLabel: 'logo',
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

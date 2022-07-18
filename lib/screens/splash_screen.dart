import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity,),
            Container(
              height: 200,
              width: 200,
              decoration:ShapeDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 50,
                    cornerSmoothing: 1,
                  ),
                ),
              ),
              child: Center(
                child: Hero(
                  tag: 'AppIcon',
                  child: FaIcon(
                    FontAwesomeIcons.clipboardList,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 80,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'iDo',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

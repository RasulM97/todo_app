import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('About me'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Hero(
            tag: 'about',
            child: SizedBox(
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const FaIcon(FontAwesomeIcons.xmark)),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'iDo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 45,
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Organize your plans in each day with me 😊\n'
                  'Please rate us in stores. 💕',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 10,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              // todo: add report bug later
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: OutlinedButton(
              //       style: OutlinedButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),
              //       onPressed: (){},
              //       child: Text('Report bug -> 🪲',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Theme.of(context).colorScheme.onPrimary,
              //       ),),
              //     )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState){
                      case ConnectionState.done:
                        return Text(
                          snapshot.data!.version,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary),
                        );
                      default:
                        return const CircularProgressIndicator();
                    }
                  },

                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

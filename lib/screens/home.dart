import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_enroute/gen/assets.gen.dart';
import 'package:masjid_enroute/providers.dart';
import 'package:masjid_enroute/widgets/search_result_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initLocation();
  }

  Future<void> initLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    var permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.denied) {
      permissionStatus = await Geolocator.requestPermission();
    }

    if (permissionStatus == LocationPermission.denied ||
        permissionStatus == LocationPermission.deniedForever) return;

    final locationData = await Geolocator.getCurrentPosition();

    final loc = LatLng(locationData.latitude, locationData.longitude);
    context.read(homeNotifierProvider.notifier).update(startLoc: loc);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.grey[100],
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: Assets.images.homescreen),
          // gradient: LinearGradient(
          //   colors: [Color(0xFF152834), Color(0xFF95B0B9)],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () {},
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const _HomeText(text: 'Start'),
              const _HomeText(text: 'Destination'),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeText extends StatelessWidget {
  final String text;
  const _HomeText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, text),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }

  void onTap(BuildContext context, String text) {
    final isStart = text == 'Start';
    final initialText = context.read(homeNotifierProvider).maybeWhen(
          data: (value) => isStart ? value.startName : value.destinationName,
          orElse: () => '',
        );
        
    final controller = TextEditingController(text: initialText);

    showMaterialModalBottomSheet(
      context: context,
      expand: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.xmark_circle),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: controller,
                      placeholder: text,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      onChanged: (value) => isStart
                          ? context
                              .read(homeNotifierProvider.notifier)
                              .update(startName: value)
                          : context
                              .read(homeNotifierProvider.notifier)
                              .update(destinationName: value),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Consumer(builder: (context, watch, child) {
                  final results = watch(homeNotifierProvider);
                  return results.maybeWhen(
                    data: (value) => ListView.builder(
                      controller: ModalScrollController.of(context),
                      itemCount: value.searchResults.length,
                      itemBuilder: (context, index) {
                        return SearchResultTile(
                          result: value.searchResults[index],
                        );
                      },
                    ),
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

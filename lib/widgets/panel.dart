import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_enroute/providers.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Panel extends StatefulWidget {
  final PanelController panelController;
  final ScrollController scrollController;

  const Panel({
    Key? key,
    required this.scrollController,
    required this.panelController,
  }) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: widget.scrollController,
        children: <Widget>[
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          // Consumer(
          //   builder: (context, watch, child) {
          //     final state = watch(homeNotifierProvider);
          //     return value
          //         ? Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: const [Text('Searching')],
          //           )
          //         : child!;
          //   },
            
          // ),
        ],
      ),
    );
  }
}

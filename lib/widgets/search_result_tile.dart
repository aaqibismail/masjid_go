import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class SearchResultTile extends StatelessWidget {
  final SearchResult result;
  const SearchResultTile({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? title = result.name ?? result.formattedAddress;
    title ??= '';

    return ListTile(
      title: Text(title),
    );
  }
}
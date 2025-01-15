// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_html/flutter_html.dart'; // Import flutter_html package
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts package

class HtmlContentWidget extends StatefulWidget {
  const HtmlContentWidget({
    super.key,
    this.width,
    this.height,
    this.htmlData,
  });

  final double? width;
  final double? height;
  final String? htmlData;

  @override
  State<HtmlContentWidget> createState() => _HtmlContentWidgetState();
}

class _HtmlContentWidgetState extends State<HtmlContentWidget> {
  bool hasImages = false;
  final String baseUrl = 'https://tmafrica.co.ug'; // Set your base URL here

  @override
  void initState() {
    super.initState();
    _checkForImages();
  }

  void _checkForImages() {
    if (widget.htmlData != null) {
      final imgRegex =
          RegExp(r'<img\s+[^>]*src="([^"]*)"', caseSensitive: false);
      hasImages = imgRegex.hasMatch(widget.htmlData!);
      setState(() {});
    }
  }

  String _updateImageUrls(String html) {
    final imgRegex =
        RegExp(r'<img\s+([^>]*?)src="([^"]*)"', caseSensitive: false);

    return html.replaceAllMapped(imgRegex, (match) {
      final existingAttributes = match.group(1) ?? '';
      final relativeUrl = match.group(2) ?? '';
      final absoluteUrl =
          relativeUrl.startsWith('http') ? relativeUrl : '$baseUrl$relativeUrl';

      // Combine existing attributes with the new ones
      return '<img $existingAttributes src="$absoluteUrl" width="100%" style="display: block;" />';
    });
  }

  @override
  Widget build(BuildContext context) {
    final updatedHtmlData = widget.htmlData != null && hasImages
        ? _updateImageUrls(widget.htmlData!)
        : widget.htmlData;

    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        child: Html(
          data: updatedHtmlData,
          style: {
            "body": Style(
              fontSize: FontSize.large, // Customize font size
              textAlign: TextAlign.justify,
              fontFamily:
                  GoogleFonts.cagliostro().fontFamily, // Use Cagliostro font
            ),
          },
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'video_details_widget.dart' show VideoDetailsWidget;
import 'package:flutter/material.dart';

class VideoDetailsModel extends FlutterFlowModel<VideoDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

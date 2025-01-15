import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'view_broadcast_model.dart';
export 'view_broadcast_model.dart';

class ViewBroadcastWidget extends StatefulWidget {
  const ViewBroadcastWidget({
    super.key,
    required this.playbackId,
  });

  final String? playbackId;

  @override
  State<ViewBroadcastWidget> createState() => _ViewBroadcastWidgetState();
}

class _ViewBroadcastWidgetState extends State<ViewBroadcastWidget> {
  late ViewBroadcastModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewBroadcastModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'TMAfrica Live',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'EB Garamond',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FlutterFlowVideoPlayer(
            path: functions.buildSteamUrl(widget.playbackId!),
            videoType: VideoType.network,
            autoPlay: true,
            looping: false,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: true,
          ),
        ),
      ),
    );
  }
}

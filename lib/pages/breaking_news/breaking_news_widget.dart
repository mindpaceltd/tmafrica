import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'breaking_news_model.dart';
export 'breaking_news_model.dart';

class BreakingNewsWidget extends StatefulWidget {
  const BreakingNewsWidget({super.key});

  @override
  State<BreakingNewsWidget> createState() => _BreakingNewsWidgetState();
}

class _BreakingNewsWidgetState extends State<BreakingNewsWidget> {
  late BreakingNewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreakingNewsModel());
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Breaking News',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'EB Garamond',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<ApiCallResponse>(
              future: FFAppState().breakingNews(
                requestFn: () => BreakingNewsCall.call(),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listViewBreakingNewsResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final newsLIst = BreakingNewsCall.breaking(
                          listViewBreakingNewsResponse.jsonBody,
                        )?.toList() ??
                        [];

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: newsLIst.length,
                      itemBuilder: (context, newsLIstIndex) {
                        final newsLIstItem = newsLIst[newsLIstIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'NewsDetails',
                                queryParameters: {
                                  'id': serializeParam(
                                    getJsonField(
                                      newsLIstItem,
                                      r'''$.id''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'photoUrl': serializeParam(
                                    getJsonField(
                                      newsLIstItem,
                                      r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'body': serializeParam(
                                    getJsonField(
                                      newsLIstItem,
                                      r'''$.attributes.body.processed''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'created': serializeParam(
                                    functions
                                        .convertToRelativeTime(getJsonField(
                                      newsLIstItem,
                                      r'''$.attributes.created''',
                                    ).toString()),
                                    ParamType.String,
                                  ),
                                  'title': serializeParam(
                                    getJsonField(
                                      newsLIstItem,
                                      r'''$.attributes.title''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'newsType': serializeParam(
                                    functions.newsType(getJsonField(
                                      newsLIstItem,
                                      r'''$.relationships.field_news_types.data.id''',
                                    ).toString()),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.6,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  newsLIstItem,
                                                  r'''$.attributes.title''',
                                                )?.toString(),
                                                'Title',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'EB Garamond',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: functions
                                                    .newsType(getJsonField(
                                                  newsLIstItem,
                                                  r'''$.relationships.field_news_types.data.id''',
                                                ).toString())!,
                                                options: FFButtonOptions(
                                                  height: 35.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mainColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'EB Garamond',
                                                            color: Colors.white,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .convertToRelativeTime(
                                                                getJsonField(
                                                          newsLIstItem,
                                                          r'''$.attributes.created''',
                                                        ).toString()),
                                                        'Date',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'EB Garamond',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            newsLIstItem,
                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                          )?.toString(),
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                        ),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? tabIndexRef,
  }) : tabIndexRef = tabIndexRef ?? 0;

  final int tabIndexRef;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 13,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabIndexRef,
            0,
          ),
          12),
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().news(
        requestFn: () => NewsCall.call(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homePageNewsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/origin-logo.png',
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('About');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.exclamationCircle,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'About Us',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'EB Garamond',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          unawaited(
                            () async {
                              await launchURL(
                                  'https://tmafrica.co.ug/page/private-policy');
                            }(),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.lock,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Privacy Policy',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'EB Garamond',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Contact');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.call,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Contact Us',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'EB Garamond',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await launchURL(
                              'https://youtube.com/@torchmediaafrica?si=WuFDhLt7WTDLureu');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.youtube,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Youtube Channel',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'EB Garamond',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: FaIcon(
                          FontAwesomeIcons.bars,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/origin-logo.png',
                          width: 90.0,
                          height: 24.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        labelColor: FlutterFlowTheme.of(context).mainColor2,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelPadding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'EB Garamond',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'EB Garamond',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).mainColor2,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        tabs: const [
                          Tab(
                            text: 'Explore',
                          ),
                          Tab(
                            text: 'News',
                          ),
                          Tab(
                            text: 'Sports',
                          ),
                          Tab(
                            text: 'Business',
                          ),
                          Tab(
                            text: 'Culture',
                          ),
                          Tab(
                            text: 'Politics',
                          ),
                          Tab(
                            text: 'Health',
                          ),
                          Tab(
                            text: 'World News',
                          ),
                          Tab(
                            text: 'Agriculture',
                          ),
                          Tab(
                            text: 'Tourism',
                          ),
                          Tab(
                            text: 'Technology',
                          ),
                          Tab(
                            text: 'Travel',
                          ),
                          Tab(
                            text: 'Opinion',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final newsCarousel = NewsCall.news(
                                              homePageNewsResponse.jsonBody,
                                            )?.toList() ??
                                            [];

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 250.0,
                                          child: CarouselSlider.builder(
                                            itemCount: newsCarousel.length,
                                            itemBuilder: (context,
                                                newsCarouselIndex, _) {
                                              final newsCarouselItem =
                                                  newsCarousel[
                                                      newsCarouselIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          newsCarouselItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            newsCarouselItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          newsCarouselItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        functions
                                                            .convertToRelativeTime(
                                                                getJsonField(
                                                          newsCarouselItem,
                                                          r'''$.attributes.created''',
                                                        ).toString()),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        getJsonField(
                                                          newsCarouselItem,
                                                          r'''$.attributes.title''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          newsCarouselItem,
                                                          r'''$.relationships.field_news_types.data.id''',
                                                        ).toString()),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            newsCarouselItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                      ),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: functions
                                                                  .newsType(
                                                                      getJsonField(
                                                                newsCarouselItem,
                                                                r'''$.relationships.field_news_types.data.id''',
                                                              ).toString())!,
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 35.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .mainColor,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'EB Garamond',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0x74090909),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    newsCarouselItem,
                                                                    r'''$.attributes.title''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              newsCarouselItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                      ),
                                                    ]
                                                        .divide(const SizedBox(
                                                            height: 10.0))
                                                        .around(const SizedBox(
                                                            height: 10.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                            carouselController:
                                                _model.carouselController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(
                                                  0,
                                                  min(1,
                                                      newsCarousel.length - 1)),
                                              viewportFraction: 1.0,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.25,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: true,
                                              autoPlayAnimationDuration:
                                                  const Duration(milliseconds: 800),
                                              autoPlayInterval: const Duration(
                                                  milliseconds: (800 + 4000)),
                                              autoPlayCurve: Curves.linear,
                                              pauseAutoPlayInFiniteScroll: true,
                                              onPageChanged: (index, _) =>
                                                  _model.carouselCurrentIndex =
                                                      index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 5.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mainColor,
                                                ),
                                              ),
                                              Text(
                                                'Breaking News',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'EB Garamond',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('BreakingNews');
                                            },
                                            child: Text(
                                              'view all',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'EB Garamond',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: FFAppState()
                                            .breakingNews(
                                          requestFn: () =>
                                              BreakingNewsCall.call(),
                                        )
                                            .then((result) {
                                          _model.apiRequestCompleted7 = true;
                                          return result;
                                        }),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewBreakingNewsResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final breaking =
                                                  BreakingNewsCall.breaking(
                                                        listViewBreakingNewsResponse
                                                            .jsonBody,
                                                      )
                                                          ?.take(5)
                                                          .toList()
                                                          .toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                onRefresh: () async {
                                                  safeSetState(() {
                                                    FFAppState()
                                                        .clearBreakingNewsCache();
                                                    _model.apiRequestCompleted7 =
                                                        false;
                                                  });
                                                  await _model
                                                      .waitForApiRequestCompleted7();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: breaking.length,
                                                  itemBuilder:
                                                      (context, breakingIndex) {
                                                    final breakingItem =
                                                        breaking[breakingIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'NewsDetails',
                                                            queryParameters: {
                                                              'id':
                                                                  serializeParam(
                                                                '',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'photoUrl':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    breakingItem,
                                                                    r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                                  )?.toString(),
                                                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'body':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  breakingItem,
                                                                  r'''$.attributes.body.processed''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'created':
                                                                  serializeParam(
                                                                functions
                                                                    .convertToRelativeTime(
                                                                        getJsonField(
                                                                  breakingItem,
                                                                  r'''$.attributes.created''',
                                                                ).toString()),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'title':
                                                                  serializeParam(
                                                                '',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'newsType':
                                                                  serializeParam(
                                                                functions.newsType(
                                                                    getJsonField(
                                                                  breakingItem,
                                                                  r'''$.relationships.field_news_types.data.id''',
                                                                ).toString()),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.6,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            breakingItem,
                                                                            r'''$.attributes.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () {
                                                                              print('Button pressed ...');
                                                                            },
                                                                            text:
                                                                                functions.newsType(getJsonField(
                                                                              breakingItem,
                                                                              r'''$.relationships.field_news_types.data.id''',
                                                                            ).toString())!,
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 35.0,
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).mainColor,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'EB Garamond',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              borderSide: const BorderSide(
                                                                                color: Colors.transparent,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.convertToRelativeTime(getJsonField(
                                                                                          breakingItem,
                                                                                          r'''$.attributes.created''',
                                                                                        ).toString()),
                                                                                        'Date',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'EB Garamond',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 11.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  breakingItem,
                                                                                  r'''$.attributes.field_posted_by''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'EB Garamond',
                                                                                      color: FlutterFlowTheme.of(context).mainColor2,
                                                                                      fontSize: 9.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w300,
                                                                                      fontStyle: FontStyle.italic,
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      getJsonField(
                                                                        breakingItem,
                                                                        r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                                      )?.toString(),
                                                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                                    ),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.25,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.12,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorWidget: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.jpeg',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.12,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 5.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .mainColor,
                                                ),
                                              ),
                                              Text(
                                                'Must Read News',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'EB Garamond',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Articles');
                                            },
                                            child: Text(
                                              'view all',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'EB Garamond',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: FFAppState().articles(
                                          requestFn: () => ArticlesCall.call(),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewArticlesResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final articles =
                                                  ArticlesCall.articles(
                                                        listViewArticlesResponse
                                                            .jsonBody,
                                                      )
                                                          ?.take(5)
                                                          .toList()
                                                          .toList() ??
                                                      [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: articles.length,
                                                itemBuilder:
                                                    (context, articlesIndex) {
                                                  final articlesItem =
                                                      articles[articlesIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'NewsDetails',
                                                          queryParameters: {
                                                            'id':
                                                                serializeParam(
                                                              getJsonField(
                                                                articlesItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'photoUrl':
                                                                serializeParam(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                  articlesItem,
                                                                  r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                                )?.toString(),
                                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                              ),
                                                              ParamType.String,
                                                            ),
                                                            'body':
                                                                serializeParam(
                                                              getJsonField(
                                                                articlesItem,
                                                                r'''$.attributes.body.processed''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'created':
                                                                serializeParam(
                                                              getJsonField(
                                                                articlesItem,
                                                                r'''$.attributes.created''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'title':
                                                                serializeParam(
                                                              getJsonField(
                                                                articlesItem,
                                                                r'''$.attributes.title''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'newsType':
                                                                serializeParam(
                                                              functions.newsType(
                                                                  getJsonField(
                                                                articlesItem,
                                                                r'''$.relationships.field_news_types.data.id''',
                                                              ).toString()),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.6,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          articlesItem,
                                                                          r'''$.attributes.title''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'EB Garamond',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              functions.newsType(getJsonField(
                                                                            articlesItem,
                                                                            r'''$.relationships.field_news_types.data.id''',
                                                                          ).toString())!,
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                35.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).mainColor,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'EB Garamond',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.access_time,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 18.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.convertToRelativeTime(getJsonField(
                                                                                    articlesItem,
                                                                                    r'''$.attributes.created''',
                                                                                  ).toString()),
                                                                                  'Date',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'EB Garamond',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
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
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    getJsonField(
                                                                      articlesItem,
                                                                      r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                                    )?.toString(),
                                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                                  ),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.25,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.12,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.jpeg',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.25,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.12,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final newss = NewsCall.news(
                                        homePageNewsResponse.jsonBody,
                                      )?.map((e) => e).toList().toList() ??
                                      [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: newss.length,
                                    itemBuilder: (context, newssIndex) {
                                      final newssItem = newss[newssIndex];
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
                                                    newssItem,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'photoUrl': serializeParam(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      newssItem,
                                                      r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                    )?.toString(),
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'body': serializeParam(
                                                  getJsonField(
                                                    newssItem,
                                                    r'''$.attributes.body.processed''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'created': serializeParam(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .convertToRelativeTime(
                                                            getJsonField(
                                                      newssItem,
                                                      r'''$.attributes.created''',
                                                    ).toString()),
                                                    'Date',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'title': serializeParam(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      newssItem,
                                                      r'''$.attributes.title''',
                                                    )?.toString(),
                                                    'title',
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'newsType': serializeParam(
                                                  functions
                                                      .newsType(getJsonField(
                                                    newssItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                newssItem,
                                                                r'''$.attributes.title''',
                                                              )?.toString(),
                                                              'title',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'EB Garamond',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: functions
                                                                  .newsType(
                                                                      getJsonField(
                                                                newssItem,
                                                                r'''$.relationships.field_news_types.data.id''',
                                                              ).toString())!,
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 35.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .mainColor,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'EB Garamond',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .access_time,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 18.0,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions
                                                                          .convertToRelativeTime(
                                                                              getJsonField(
                                                                        newssItem,
                                                                        r'''$.attributes.created''',
                                                                      ).toString()),
                                                                      'Date',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'EB Garamond',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          newssItem,
                                                          r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                        )?.toString(),
                                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                      ),
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.25,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.12,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpeg',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.25,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.12,
                                                        fit: BoxFit.cover,
                                                      ),
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
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model
                                    .sports(
                                  requestFn: () => SportsCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted8 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewSportsResponse = snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final sports = SportsCall.sports(
                                            listViewSportsResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            _model.clearSportsCache();
                                            _model.apiRequestCompleted8 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted8();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: sports.length,
                                          itemBuilder: (context, sportsIndex) {
                                            final sportsItem =
                                                sports[sportsIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          sportsItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            sportsItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          sportsItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            sportsItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            sportsItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        '',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      sportsItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: functions
                                                                        .newsType(
                                                                            getJsonField(
                                                                      sportsItem,
                                                                      r'''$.relationships.field_news_types.data.id''',
                                                                    ).toString())!,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              sportsItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                sportsItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model
                                    .business(
                                  requestFn: () => BusinessCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted11 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewBusinessResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final business = BusinessCall.business(
                                            listViewBusinessResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            _model.clearBusinessCache();
                                            _model.apiRequestCompleted11 =
                                                false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted11();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: business.length,
                                          itemBuilder:
                                              (context, businessIndex) {
                                            final businessItem =
                                                business[businessIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          businessItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            businessItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          businessItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            businessItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            businessItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          businessItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      businessItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: functions
                                                                        .newsType(
                                                                            getJsonField(
                                                                      businessItem,
                                                                      r'''$.relationships.field_news_types.data.id''',
                                                                    ).toString())!,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              businessItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                businessItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model
                                    .culture(
                                  requestFn: () => CultureCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted6 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewCultureResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final culture = CultureCall.culture(
                                            listViewCultureResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            _model.clearCultureCache();
                                            _model.apiRequestCompleted6 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted6();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: culture.length,
                                          itemBuilder: (context, cultureIndex) {
                                            final cultureItem =
                                                culture[cultureIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          cultureItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            cultureItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          cultureItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            cultureItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            cultureItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          cultureItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      cultureItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: functions
                                                                        .newsType(
                                                                            getJsonField(
                                                                      cultureItem,
                                                                      r'''$.relationships.field_news_types.data.id''',
                                                                    ).toString())!,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              cultureItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                cultureItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model
                                    .politics(
                                  requestFn: () => PoliticsCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted5 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewPoliticsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final politics = PoliticsCall.data(
                                            listViewPoliticsResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            _model.clearPoliticsCache();
                                            _model.apiRequestCompleted5 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted5();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: politics.length,
                                          itemBuilder:
                                              (context, politicsIndex) {
                                            final politicsItem =
                                                politics[politicsIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          politicsItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            politicsItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          politicsItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            politicsItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            politicsItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          politicsItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      politicsItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: functions
                                                                        .newsType(
                                                                            getJsonField(
                                                                      politicsItem,
                                                                      r'''$.relationships.field_news_types.data.id''',
                                                                    ).toString())!,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              politicsItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                politicsItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .health(
                                  requestFn: () => HealthCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted10 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewHealthResponse = snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final health = HealthCall.data(
                                            listViewHealthResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearHealthCache();
                                            _model.apiRequestCompleted10 =
                                                false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted10();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: health.length,
                                          itemBuilder: (context, healthIndex) {
                                            final healthItem =
                                                health[healthIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          healthItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            healthItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          healthItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            healthItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            healthItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          healthItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      healthItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      functions
                                                                          .newsType(
                                                                              getJsonField(
                                                                        healthItem,
                                                                        r'''$.relationships.field_news_types.data.id''',
                                                                      ).toString()),
                                                                      'Health',
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              healthItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                healthItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .worldNews(
                                  requestFn: () => WorldNewsCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted3 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewWorldNewsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final worldNews = WorldNewsCall.data(
                                            listViewWorldNewsResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearWorldNewsCache();
                                            _model.apiRequestCompleted3 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted3();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: worldNews.length,
                                          itemBuilder:
                                              (context, worldNewsIndex) {
                                            final worldNewsItem =
                                                worldNews[worldNewsIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          worldNewsItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            worldNewsItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          worldNewsItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            worldNewsItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            worldNewsItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          worldNewsItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      worldNewsItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      functions
                                                                          .newsType(
                                                                              getJsonField(
                                                                        worldNewsItem,
                                                                        r'''$.relationships.field_news_types.data.id''',
                                                                      ).toString()),
                                                                      'Health',
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              worldNewsItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                worldNewsItem,
                                                                r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .agriculture(
                                  requestFn: () => AgricultureCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted2 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewAgricultureResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final agriculture = AgricultureCall.data(
                                            listViewAgricultureResponse
                                                .jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState()
                                                .clearAgricultureCache();
                                            _model.apiRequestCompleted2 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted2();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: agriculture.length,
                                          itemBuilder:
                                              (context, agricultureIndex) {
                                            final agricultureItem =
                                                agriculture[agricultureIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          agricultureItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            agricultureItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          agricultureItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            agricultureItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            agricultureItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          agricultureItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      agricultureItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        getJsonField(
                                                                      agricultureItem,
                                                                      r'''$.relationships.node_type.data.meta.drupal_internal__target_id''',
                                                                    ).toString(),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              agricultureItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                agricultureItem,
                                                                r'''$.attributes.field_image.uri.url''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .tourism(
                                  requestFn: () => TourismCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted4 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewTourismResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final tourism = TourismCall.data(
                                            listViewTourismResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearTourismCache();
                                            _model.apiRequestCompleted4 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted4();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: tourism.length,
                                          itemBuilder: (context, tourismIndex) {
                                            final tourismItem =
                                                tourism[tourismIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          tourismItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            tourismItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          tourismItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            tourismItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            tourismItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          tourismItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      tourismItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        getJsonField(
                                                                      tourismItem,
                                                                      r'''$.relationships.node_type.data.meta.drupal_internal__target_id''',
                                                                    ).toString(),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              tourismItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                tourismItem,
                                                                r'''$.relationships.field_news_photo.links.related.href''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .technology(
                                  requestFn: () => TechnologyCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted1 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewTechnologyResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final technology = TechnologyCall.data(
                                            listViewTechnologyResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearTechnologyCache();
                                            _model.apiRequestCompleted1 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: technology.length,
                                          itemBuilder:
                                              (context, technologyIndex) {
                                            final technologyItem =
                                                technology[technologyIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          technologyItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            technologyItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          technologyItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            technologyItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            technologyItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          technologyItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      technologyItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        getJsonField(
                                                                      technologyItem,
                                                                      r'''$.relationships.node_type.data.meta.drupal_internal__target_id''',
                                                                    ).toString(),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              technologyItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                technologyItem,
                                                                r'''$.relationships.field_news_photo.links.related.href''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .travel(
                                  requestFn: () => TravelCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted12 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewTravelResponse = snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final travel = TravelCall.data(
                                            listViewTravelResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearTravelCache();
                                            _model.apiRequestCompleted12 =
                                                false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted12();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: travel.length,
                                          itemBuilder: (context, travelIndex) {
                                            final travelItem =
                                                travel[travelIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          travelItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            travelItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          travelItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            travelItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            travelItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          travelItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      travelItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        getJsonField(
                                                                      travelItem,
                                                                      r'''$.relationships.node_type.data.meta.drupal_internal__target_id''',
                                                                    ).toString(),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              travelItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                travelItem,
                                                                r'''$.relationships.field_news_photo.links.related.href''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .opinion(
                                  requestFn: () => OpinionCall.call(),
                                )
                                    .then((result) {
                                  _model.apiRequestCompleted9 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewOpinionResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final opinion = OpinionCall.data(
                                            listViewOpinionResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState().clearOpinionCache();
                                            _model.apiRequestCompleted9 = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted9();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.vertical,
                                          itemCount: opinion.length,
                                          itemBuilder: (context, opinionIndex) {
                                            final opinionItem =
                                                opinion[opinionIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'NewsDetails',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        getJsonField(
                                                          opinionItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            opinionItem,
                                                            r'''$.attributes.metatag[?(@.tag=='meta' && @.attributes.property=='og:image')].attributes.content''',
                                                          )?.toString(),
                                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'body': serializeParam(
                                                        getJsonField(
                                                          opinionItem,
                                                          r'''$.attributes.body.processed''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'created': serializeParam(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .convertToRelativeTime(
                                                                  getJsonField(
                                                            opinionItem,
                                                            r'''$.attributes.created''',
                                                          ).toString()),
                                                          'Date',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            opinionItem,
                                                            r'''$.attributes.title''',
                                                          )?.toString(),
                                                          'title',
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'newsType':
                                                          serializeParam(
                                                        functions.newsType(
                                                            getJsonField(
                                                          opinionItem,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      opinionItem,
                                                                      r'''$.attributes.title''',
                                                                    )?.toString(),
                                                                    'title',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'EB Garamond',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        getJsonField(
                                                                      opinionItem,
                                                                      r'''$.relationships.node_type.data.meta.drupal_internal__target_id''',
                                                                    ).toString(),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .mainColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'EB Garamond',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.convertToRelativeTime(getJsonField(
                                                                              opinionItem,
                                                                              r'''$.attributes.created''',
                                                                            ).toString()),
                                                                            'Date',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'EB Garamond',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
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
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                opinionItem,
                                                                r'''$.relationships.field_news_photo.links.related.href''',
                                                              )?.toString(),
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/2560px-Placeholder_view_vector.svg.png',
                                                            ),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.25,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpeg',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.25,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.12,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
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
          ),
        );
      },
    );
  }
}

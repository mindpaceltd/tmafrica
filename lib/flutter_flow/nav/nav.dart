import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                child: Center(
                  child: Image.asset(
                    'assets/images/origin-logo.png',
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : const NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    child: Center(
                      child: Image.asset(
                        'assets/images/origin-logo.png',
                        height: MediaQuery.sizeOf(context).height * 0.08,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : const NavBarPage(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage')
              : NavBarPage(
                  initialPage: 'HomePage',
                  page: HomePageWidget(
                    tabIndexRef: params.getParam(
                      'tabIndexRef',
                      ParamType.int,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'Category',
          path: '/category',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Category')
              : const CategoryWidget(),
        ),
        FFRoute(
          name: 'Videos',
          path: '/videos',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Videos')
              : const VideosWidget(),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          builder: (context, params) => const SearchWidget(),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => SearchPageWidget(
            searchResult: params.getParam(
              'searchResult',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'About',
          path: '/about',
          builder: (context, params) => const AboutWidget(),
        ),
        FFRoute(
          name: 'NewsDetails',
          path: '/newsDetails',
          builder: (context, params) => NewsDetailsWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            photoUrl: params.getParam(
              'photoUrl',
              ParamType.String,
            ),
            body: params.getParam(
              'body',
              ParamType.String,
            ),
            created: params.getParam(
              'created',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            newsType: params.getParam(
              'newsType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'News',
          path: '/news',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'News') : const NewsWidget(),
        ),
        FFRoute(
          name: 'Contact',
          path: '/contact',
          builder: (context, params) => const ContactWidget(),
        ),
        FFRoute(
          name: 'VideoDetails',
          path: '/videoDetails',
          builder: (context, params) => VideoDetailsWidget(
            yut: params.getParam(
              'yut',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'BreakingNews',
          path: '/breakingNews',
          builder: (context, params) => const BreakingNewsWidget(),
        ),
        FFRoute(
          name: 'Articles',
          path: '/articles',
          builder: (context, params) => const ArticlesWidget(),
        ),
        FFRoute(
          name: 'BroadcastListing',
          path: '/broadcastListing',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'BroadcastListing')
              : const BroadcastListingWidget(),
        ),
        FFRoute(
          name: 'ViewBroadcast',
          path: '/viewBroadcast',
          builder: (context, params) => ViewBroadcastWidget(
            playbackId: params.getParam(
              'playbackId',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

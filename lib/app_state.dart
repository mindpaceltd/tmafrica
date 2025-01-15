import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SearchHistory =
          prefs.getStringList('ff_SearchHistory') ?? _SearchHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _SearchHistory = [];
  List<String> get SearchHistory => _SearchHistory;
  set SearchHistory(List<String> value) {
    _SearchHistory = value;
    prefs.setStringList('ff_SearchHistory', value);
  }

  void addToSearchHistory(String value) {
    SearchHistory.add(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeFromSearchHistory(String value) {
    SearchHistory.remove(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeAtIndexFromSearchHistory(int index) {
    SearchHistory.removeAt(index);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void updateSearchHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SearchHistory[index] = updateFn(_SearchHistory[index]);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void insertAtIndexInSearchHistory(int index, String value) {
    SearchHistory.insert(index, value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  final _newsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> news({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _newsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsCache() => _newsManager.clear();
  void clearNewsCacheKey(String? uniqueKey) =>
      _newsManager.clearRequest(uniqueKey);

  final _articlesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> articles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _articlesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearArticlesCache() => _articlesManager.clear();
  void clearArticlesCacheKey(String? uniqueKey) =>
      _articlesManager.clearRequest(uniqueKey);

  final _videosManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> videos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _videosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVideosCache() => _videosManager.clear();
  void clearVideosCacheKey(String? uniqueKey) =>
      _videosManager.clearRequest(uniqueKey);

  final _breakingNewsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> breakingNews({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _breakingNewsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBreakingNewsCache() => _breakingNewsManager.clear();
  void clearBreakingNewsCacheKey(String? uniqueKey) =>
      _breakingNewsManager.clearRequest(uniqueKey);

  final _healthManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> health({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _healthManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHealthCache() => _healthManager.clear();
  void clearHealthCacheKey(String? uniqueKey) =>
      _healthManager.clearRequest(uniqueKey);

  final _agricultureManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> agriculture({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _agricultureManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAgricultureCache() => _agricultureManager.clear();
  void clearAgricultureCacheKey(String? uniqueKey) =>
      _agricultureManager.clearRequest(uniqueKey);

  final _tourismManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> tourism({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _tourismManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTourismCache() => _tourismManager.clear();
  void clearTourismCacheKey(String? uniqueKey) =>
      _tourismManager.clearRequest(uniqueKey);

  final _worldNewsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> worldNews({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _worldNewsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWorldNewsCache() => _worldNewsManager.clear();
  void clearWorldNewsCacheKey(String? uniqueKey) =>
      _worldNewsManager.clearRequest(uniqueKey);

  final _technologyManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> technology({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _technologyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTechnologyCache() => _technologyManager.clear();
  void clearTechnologyCacheKey(String? uniqueKey) =>
      _technologyManager.clearRequest(uniqueKey);

  final _travelManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> travel({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _travelManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTravelCache() => _travelManager.clear();
  void clearTravelCacheKey(String? uniqueKey) =>
      _travelManager.clearRequest(uniqueKey);

  final _opinionManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> opinion({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _opinionManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOpinionCache() => _opinionManager.clear();
  void clearOpinionCacheKey(String? uniqueKey) =>
      _opinionManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

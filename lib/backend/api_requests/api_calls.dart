import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AboutCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'About',
      apiUrl:
          'https://tmafrica.co.ug/jsonapi/node/page/d93502b1-d643-49a8-9c7f-a16128f3aeff',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class VideosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Videos',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/videos?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? videos(dynamic response) => getJsonField(
        response,
        r'''$.data[:]''',
        true,
      ) as List?;
  static List<String>? src(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.body.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'News',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? news(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postedBy(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.field_posted_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BreakingNewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Breaking News',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "a44a2f69-24ef-4aca-8faa-7a72eef1ef2f",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? breaking(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newstype(dynamic response) => getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data''',
        true,
      ) as List?;
  static List<String>? posted(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.field_posted_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BusinessCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Business',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "4972a528-927a-463e-8a5a-446da0a639d2",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? business(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newstype(dynamic response) => getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data''',
        true,
      ) as List?;
}

class CultureCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Culture',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "2b2972d2-995c-4259-a780-fc7e7bd8f402",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? culture(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newstype(dynamic response) => getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data''',
        true,
      ) as List?;
}

class HealthScienceCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Health  Science',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "066a8041-5edd-4701-9788-7e8409e759a6",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? news(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newstype(dynamic response) => getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data''',
        true,
      ) as List?;
}

class SportsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sports',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "66d3b704-895e-47c3-8f81-e03b373eaa66",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? sports(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newstype(dynamic response) => getJsonField(
        response,
        r'''$.data[:].relationships.field_news_types.data''',
        true,
      ) as List?;
}

class ArticlesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Articles',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/article?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? articles(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class PoliticsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Politics',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "ff61a8fa-8876-4488-ad3a-3fc4790397dc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? body(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.body.processed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class HealthCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Health',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "066a8041-5edd-4701-9788-7e8409e759a6",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? body(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.body.processed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class WorldNewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'World News',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/n?sort=-created',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'filter[field_news_types.id]': "048b4956-7cc0-4226-9b77-5022f39061a9",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? body(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.body.processed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchCall {
  static Future<ApiCallResponse> call({
    String? key = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl: 'https://tmafrica.co.ug/search/node',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'keys': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewTypeCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'New Type',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/taxonomy_term/news_type',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        '?filter[id]': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetLiveStreamIdCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStreamId',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/$playbackId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic TVVYX1RPS0VOX0lEOjRNTm5tbHJvYUZNSTdzUFFqdm5XUEdvZ1pkS25KcVhiaW9QK1RmZW9HTXp3cXVrcjFtY0dydWpEcktFellyc0lkem90TjIvcXZqag==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets?live_stream_id=$streamId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic TVVYX1RPS0VOX0lEOjRNTm5tbHJvYUZNSTdzUFFqdm5XUEdvZ1pkS25KcVhiaW9QK1RmZW9HTXp3cXVrcjFtY0dydWpEcktFellyc0lkem90TjIvcXZqag==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class LiveStreamsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'live streams',
      apiUrl: 'https://api.mux.com/video/v1/live-streams',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic YzAyMTkyOTItOWE2Ni00OTMxLThlMzctNzdlYjM4MmVjYWQwOldyQ0cwRkoybXpQN0NweFhOYVBVK0FVTUVvY0dxOTJYbktBb0dlV2VjNTIreGR1eWpLckF3dVMzelJSbnJrRzJOTzQ2UVhpcjJocw==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].status''',
      ));
  static String? streamkey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].stream_key''',
      ));
  static List? playbackids(dynamic response) => getJsonField(
        response,
        r'''$.data[:].playback_ids''',
        true,
      ) as List?;
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static String? playbackid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].playback_ids[:].id''',
      ));
}

class AgricultureCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Agriculture',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/agriculture?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdat(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? datatype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].relationships.node_type.data.meta.drupal_internal__target_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TourismCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Tourism',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/tourism?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? author(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.body.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postedby(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.field_posted_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].relationships.node_type.data.meta.drupal_internal__target_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TravelCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Travel',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/travel?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class OpinionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Opinion',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/opinions?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].relationships.node_type.data.meta.drupal_internal__target_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TechnologyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Technology',
      apiUrl: 'https://tmafrica.co.ug/jsonapi/node/technology?sort=-created',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].attributes.created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? body(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attributes.body''',
        true,
      ) as List?;
  static List<String>? technology(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].relationships.node_type.data.meta.drupal_internal__target_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

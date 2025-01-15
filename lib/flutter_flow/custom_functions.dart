import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? convertToRelativeTime(String timestamp) {
  // function to convert the given timestamps into relative time like "3 minutes ago" and then show the date after some time has passed
  final now = DateTime.now();
  final date = DateTime.parse(timestamp);
  final difference = now.difference(date);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    final formatter = DateFormat('MMM d, yyyy');
    return formatter.format(date);
  }
}

String? convertsHtml(String? html) {
  // function To format and display HTML content in a Flutter application,
  if (html == null) {
    return null;
  }

  // Replace common HTML entities with their corresponding characters
  html = html.replaceAll('&amp;', '&');
  html = html.replaceAll('&lt;', '<');
  html = html.replaceAll('&gt;', '>');
  html = html.replaceAll('&quot;', '"');
  html = html.replaceAll('&apos;', "'");

  // Remove any remaining HTML tags
  final regex = RegExp(r'<[^>]*>');
  html = html.replaceAll(regex, '');

  return html;
}

String? newsType(String? newsTypeId) {
// Create a map of news type IDs to their corresponding names
  final Map<String, String> newsTypeMap = {
    "2b2972d2-995c-4259-a780-fc7e7bd8f402": "Culture",
    "ff61a8fa-8876-4488-ad3a-3fc4790397dc": "Politics",
    "4972a528-927a-463e-8a5a-446da0a639d2": "Business",
    "66d3b704-895e-47c3-8f81-e03b373eaa66": "Sports",
    "a44a2f69-24ef-4aca-8faa-7a72eef1ef2f": "Breaking news",
    "066a8041-5edd-4701-9788-7e8409e759a6": "Health",
    "048b4956-7cc0-4226-9b77-5022f39061a9": "World News"
  };

  // Return the corresponding news type name or "News" if the ID is not found
  return newsTypeMap[newsTypeId] ?? "News";
}

String? returnLink(String? html) {
  // function to identify and return youtube url from html section
  if (html == null) {
    return null;
  }
  final regex = RegExp(
      r'(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:embed\/|watch\?v=)|youtu\.be\/)([\w\-]+)');
  final match = regex.firstMatch(html);
  return match?.group(0);
}

String? linkToVideo(String? link) {
  // function to convert the provided url to videopath data type
  if (link == null) {
    return null;
  }
  if (link.contains('youtube.com') || link.contains('youtu.be')) {
    final regExp = RegExp(r'(?:youtube\.com\/watch\?v=|youtu\.be\/)([\w\-]+)',
        caseSensitive: false, multiLine: false);
    final match = regExp.firstMatch(link);
    if (match != null && match.groupCount >= 1) {
      final videoId = match.group(1);
      return 'https://www.youtube.com/embed/$videoId';
    }
  } else if (link.contains('vimeo.com')) {
    final regExp = RegExp(r'vimeo\.com\/(\d+)', caseSensitive: false);
    final match = regExp.firstMatch(link);
    if (match != null && match.groupCount >= 1) {
      final videoId = match.group(1);
      return 'https://player.vimeo.com/video/$videoId';
    }
  }
  return null;
}

String? getVideoId(String? url) {
  // function to extract youtube video id from youtube video url
  if (url == null) {
    return null;
  }

  final regExp = RegExp(
    r'^https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})',
  );

  final match = regExp.firstMatch(url);

  if (match != null && match.groupCount >= 1) {
    return match.group(1);
  }

  return null;
}

String? returnLinkCopy(String? html) {
  // function to identify and return youtube url from html section
  if (html == null) {
    return null;
  }
  final regex = RegExp(
      r'(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:embed\/|watch\?v=)|youtu\.be\/)([\w\-]+)');
  final match = regex.firstMatch(html);
  return match?.group(0);
}

String buildSteamUrl(String playbackid) {
  //   // build the playback URL dynamically, we can create a function that takes the playback_id as an input and constructs the full playback URL for mux stream
  return 'https://stream.mux.com/$playbackid.m3u8';
}

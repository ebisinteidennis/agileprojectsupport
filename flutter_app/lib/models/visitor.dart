import 'package:json_annotation/json_annotation.dart';

part 'visitor.g.dart';

@JsonSerializable()
class Visitor {
  final int id;
  final String ipAddress;
  final String? userAgent;
  final String? country;
  final String? city;
  final String? referrer;
  final String visitedPage;
  final DateTime timestamp;
  final int duration;
  final String? deviceType;
  final String? browser;
  final String? operatingSystem;
  final bool isUnique;
  final int pageViews;
  final String sessionId;

  Visitor({
    required this.id,
    required this.ipAddress,
    this.userAgent,
    this.country,
    this.city,
    this.referrer,
    required this.visitedPage,
    required this.timestamp,
    required this.duration,
    this.deviceType,
    this.browser,
    this.operatingSystem,
    required this.isUnique,
    required this.pageViews,
    required this.sessionId,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorToJson(this);
}

@JsonSerializable()
class VisitorStats {
  final int totalVisitors;
  final int uniqueVisitors;
  final int totalPageViews;
  final double averageDuration;
  final int todayVisitors;
  final int weekVisitors;
  final int monthVisitors;
  final List<CountryStats> topCountries;
  final List<PageStats> topPages;
  final List<ReferrerStats> topReferrers;
  final List<ChartData> dailyVisitors;
  final List<ChartData> hourlyVisitors;

  VisitorStats({
    required this.totalVisitors,
    required this.uniqueVisitors,
    required this.totalPageViews,
    required this.averageDuration,
    required this.todayVisitors,
    required this.weekVisitors,
    required this.monthVisitors,
    required this.topCountries,
    required this.topPages,
    required this.topReferrers,
    required this.dailyVisitors,
    required this.hourlyVisitors,
  });

  factory VisitorStats.fromJson(Map<String, dynamic> json) =>
      _$VisitorStatsFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorStatsToJson(this);
}

@JsonSerializable()
class CountryStats {
  final String country;
  final int visitors;
  final double percentage;

  CountryStats({
    required this.country,
    required this.visitors,
    required this.percentage,
  });

  factory CountryStats.fromJson(Map<String, dynamic> json) =>
      _$CountryStatsFromJson(json);

  Map<String, dynamic> toJson() => _$CountryStatsToJson(this);
}

@JsonSerializable()
class PageStats {
  final String page;
  final int views;
  final double percentage;

  PageStats({
    required this.page,
    required this.views,
    required this.percentage,
  });

  factory PageStats.fromJson(Map<String, dynamic> json) =>
      _$PageStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PageStatsToJson(this);
}

@JsonSerializable()
class ReferrerStats {
  final String referrer;
  final int visitors;
  final double percentage;

  ReferrerStats({
    required this.referrer,
    required this.visitors,
    required this.percentage,
  });

  factory ReferrerStats.fromJson(Map<String, dynamic> json) =>
      _$ReferrerStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ReferrerStatsToJson(this);
}

@JsonSerializable()
class ChartData {
  final String label;
  final int value;
  final DateTime date;

  ChartData({
    required this.label,
    required this.value,
    required this.date,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataToJson(this);
}
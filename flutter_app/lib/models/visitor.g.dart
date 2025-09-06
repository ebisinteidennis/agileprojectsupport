// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visitor _$VisitorFromJson(Map<String, dynamic> json) => Visitor(
      id: (json['id'] as num).toInt(),
      ipAddress: json['ipAddress'] as String,
      userAgent: json['userAgent'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      referrer: json['referrer'] as String?,
      visitedPage: json['visitedPage'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      duration: (json['duration'] as num).toInt(),
      deviceType: json['deviceType'] as String?,
      browser: json['browser'] as String?,
      operatingSystem: json['operatingSystem'] as String?,
      isUnique: json['isUnique'] as bool,
      pageViews: (json['pageViews'] as num).toInt(),
      sessionId: json['sessionId'] as String,
    );

Map<String, dynamic> _$VisitorToJson(Visitor instance) => <String, dynamic>{
      'id': instance.id,
      'ipAddress': instance.ipAddress,
      'userAgent': instance.userAgent,
      'country': instance.country,
      'city': instance.city,
      'referrer': instance.referrer,
      'visitedPage': instance.visitedPage,
      'timestamp': instance.timestamp.toIso8601String(),
      'duration': instance.duration,
      'deviceType': instance.deviceType,
      'browser': instance.browser,
      'operatingSystem': instance.operatingSystem,
      'isUnique': instance.isUnique,
      'pageViews': instance.pageViews,
      'sessionId': instance.sessionId,
    };

VisitorStats _$VisitorStatsFromJson(Map<String, dynamic> json) => VisitorStats(
      totalVisitors: (json['totalVisitors'] as num).toInt(),
      uniqueVisitors: (json['uniqueVisitors'] as num).toInt(),
      totalPageViews: (json['totalPageViews'] as num).toInt(),
      averageDuration: (json['averageDuration'] as num).toDouble(),
      todayVisitors: (json['todayVisitors'] as num).toInt(),
      weekVisitors: (json['weekVisitors'] as num).toInt(),
      monthVisitors: (json['monthVisitors'] as num).toInt(),
      topCountries: (json['topCountries'] as List<dynamic>)
          .map((e) => CountryStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      topPages: (json['topPages'] as List<dynamic>)
          .map((e) => PageStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      topReferrers: (json['topReferrers'] as List<dynamic>)
          .map((e) => ReferrerStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyVisitors: (json['dailyVisitors'] as List<dynamic>)
          .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyVisitors: (json['hourlyVisitors'] as List<dynamic>)
          .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisitorStatsToJson(VisitorStats instance) =>
    <String, dynamic>{
      'totalVisitors': instance.totalVisitors,
      'uniqueVisitors': instance.uniqueVisitors,
      'totalPageViews': instance.totalPageViews,
      'averageDuration': instance.averageDuration,
      'todayVisitors': instance.todayVisitors,
      'weekVisitors': instance.weekVisitors,
      'monthVisitors': instance.monthVisitors,
      'topCountries': instance.topCountries,
      'topPages': instance.topPages,
      'topReferrers': instance.topReferrers,
      'dailyVisitors': instance.dailyVisitors,
      'hourlyVisitors': instance.hourlyVisitors,
    };

CountryStats _$CountryStatsFromJson(Map<String, dynamic> json) => CountryStats(
      country: json['country'] as String,
      visitors: (json['visitors'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$CountryStatsToJson(CountryStats instance) =>
    <String, dynamic>{
      'country': instance.country,
      'visitors': instance.visitors,
      'percentage': instance.percentage,
    };

PageStats _$PageStatsFromJson(Map<String, dynamic> json) => PageStats(
      page: json['page'] as String,
      views: (json['views'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$PageStatsToJson(PageStats instance) => <String, dynamic>{
      'page': instance.page,
      'views': instance.views,
      'percentage': instance.percentage,
    };

ReferrerStats _$ReferrerStatsFromJson(Map<String, dynamic> json) =>
    ReferrerStats(
      referrer: json['referrer'] as String,
      visitors: (json['visitors'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$ReferrerStatsToJson(ReferrerStats instance) =>
    <String, dynamic>{
      'referrer': instance.referrer,
      'visitors': instance.visitors,
      'percentage': instance.percentage,
    };

ChartData _$ChartDataFromJson(Map<String, dynamic> json) => ChartData(
      label: json['label'] as String,
      value: (json['value'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ChartDataToJson(ChartData instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
    };

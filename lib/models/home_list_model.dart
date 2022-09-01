// To parse this JSON data, do
//
//     final homeList = homeListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeList homeListFromJson(String str) => HomeList.fromJson(json.decode(str));

String homeListToJson(HomeList data) => json.encode(data.toJson());

class HomeList {
    HomeList({
      required this.success,
      required this.message,
      required this.data,
    });

    bool success;
    String message;
    Data data;

    factory HomeList.fromJson(Map<String, dynamic> json) => HomeList(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
      required this.events,
      required this.total,
    });

    List<Event> events;
    int total;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "total": total,
    };
}

class Event {
    Event({
      required this.eventId,
      required this.eventName,
      required this.description,
      required this.eventProfilePic,
      required this.eventProfileImg,
      required this.eventUrl,
      required this.eventPriceFrom,
      required this.eventPriceTo,
      required this.readableFromDate,
      required this.readableToDate,
      required this.isFavorite,
      required this.city,
      required this.country,
      required this.keywords,
    });

    int eventId;
    String eventName;
    String description;
    String eventProfilePic;
    String eventProfileImg;
    String eventUrl;
    int eventPriceFrom;
    int eventPriceTo;
    String readableFromDate;
    String readableToDate;
    int isFavorite;
    String city;
    String country;
    List<String> keywords;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventId: json["event_id"],
        eventName: json["event_name"],
        description: json["description"],
        eventProfilePic: json["event_profile_pic"],
        eventProfileImg: json["event_profile_img"],
        eventUrl: json["event_url"],
        eventPriceFrom: json["event_price_from"],
        eventPriceTo: json["event_price_to"],
        readableFromDate: json["readable_from_date"],
        readableToDate: json["readable_to_date"],
        isFavorite: json["isFavorite"],
        city: json["city"],
        country: json["country"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "event_name": eventName,
        "description": description,
        "event_profile_pic": eventProfilePic,
        "event_profile_img": eventProfileImg,
        "event_url": eventUrl,
        "event_price_from": eventPriceFrom,
        "event_price_to": eventPriceTo,
        "readable_from_date": readableFromDate,
        "readable_to_date": readableToDate,
        "isFavorite": isFavorite,
        "city": city,
        "country": country,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}





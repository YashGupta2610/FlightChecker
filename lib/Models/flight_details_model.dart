import 'dart:convert';

class FlightDetails {
  List<FlightDetail>? data;

  FlightDetails({
    this.data,
  });

  factory FlightDetails.fromJson(Map<String, dynamic> json) => FlightDetails(
        data: json["data"] == null
            ? []
            : List<FlightDetail>.from(
                json["data"]!.map((x) => FlightDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FlightDetail {
  String? flightType;
  int? stops;
  int? totalDuration;
  List<Leg>? legs;

  FlightDetail({
    this.flightType,
    this.stops,
    this.totalDuration,
    this.legs,
  });

  factory FlightDetail.fromRawJson(String str) =>
      FlightDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlightDetail.fromJson(Map<String, dynamic> json) => FlightDetail(
        flightType: json["flightType"],
        stops: json["stops"],
        totalDuration: json["totalDuration"],
        legs: json["legs"] == null
            ? []
            : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flightType": flightType,
        "stops": stops,
        "totalDuration": totalDuration,
        "legs": legs == null
            ? []
            : List<dynamic>.from(legs!.map((x) => x.toJson())),
      };
}

class Leg {
  String? origin;
  String? destination;
  String? originCity;
  String? destinationCity;
  String? originStationName;
  String? destinationStationName;
  DateTime? estimatedDeparture;
  DateTime? scheduledDeparture;
  DateTime? estimatedArrival;
  DateTime? scheduledArrival;
  String? departureTerminal;
  String? arrivalTerminal;
  String? flightIdentifier;
  int? duration;
  String? status;
  String? flightState;
  dynamic overlay;

  Leg({
    this.origin,
    this.destination,
    this.originCity,
    this.destinationCity,
    this.originStationName,
    this.destinationStationName,
    this.estimatedDeparture,
    this.scheduledDeparture,
    this.estimatedArrival,
    this.scheduledArrival,
    this.departureTerminal,
    this.arrivalTerminal,
    this.flightIdentifier,
    this.duration,
    this.status,
    this.flightState,
    this.overlay,
  });

  factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        origin: json["origin"] ?? "",
        destination: json["destination"] ?? "",
        originCity: json["originCity"] ?? "",
        destinationCity: json["destinationCity"] ?? "",
        originStationName: json["originStationName"] ?? "",
        destinationStationName: json["destinationStationName"] ?? "",
        estimatedDeparture: json["estimatedDeparture"] == null
            ? null
            : DateTime.parse(json["estimatedDeparture"]),
        scheduledDeparture: json["scheduledDeparture"] == null
            ? null
            : DateTime.parse(json["scheduledDeparture"]),
        estimatedArrival: json["estimatedArrival"] == null
            ? null
            : DateTime.parse(json["estimatedArrival"]),
        scheduledArrival: json["scheduledArrival"] == null
            ? null
            : DateTime.parse(json["scheduledArrival"]),
        departureTerminal: json["departureTerminal"] ?? "",
        arrivalTerminal: json["arrivalTerminal"] ?? "",
        flightIdentifier: json["flightIdentifier"] ?? "",
        duration: json["duration"] ?? "",
        status: json["status"] ?? "",
        flightState: json["flightState"] ?? "",
        overlay: json["overlay"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "origin": origin ?? "",
        "destination": destination ?? "",
        "originCity": originCity ?? "",
        "destinationCity": destinationCity ?? "",
        "originStationName": originStationName ?? "",
        "destinationStationName": destinationStationName ?? "",
        "estimatedDeparture": estimatedDeparture?.toIso8601String() ?? "",
        "scheduledDeparture": scheduledDeparture?.toIso8601String() ?? "",
        "estimatedArrival": estimatedArrival?.toIso8601String() ?? "",
        "scheduledArrival": scheduledArrival?.toIso8601String() ?? "",
        "departureTerminal": departureTerminal ?? "",
        "arrivalTerminal": arrivalTerminal ?? "",
        "flightIdentifier": flightIdentifier ?? "",
        "duration": duration ?? "",
        "status": status ?? "",
        "flightState": flightState ?? "",
        "overlay": overlay ?? "",
      };
}

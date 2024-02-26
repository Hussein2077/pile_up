class Calendar {
  final DateTime eventDate;
  final String eventName;

  Calendar({
    required this.eventDate,
    required this.eventName,

  });

  factory Calendar.fromJson(Map<String, dynamic> json) => Calendar(
    eventDate: DateTime.parse(json["eventDate"]),
    eventName: json["eventName"],

  );

  Map<String, dynamic> toJson() => {
    "eventDate": eventDate,
    "eventName": eventName,
  };
}
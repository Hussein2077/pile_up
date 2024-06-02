class CalendarEvent {
  final DateTime eventDate;
  final String eventName;

  CalendarEvent({
    required this.eventDate,
    required this.eventName,

  });

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => CalendarEvent(
    eventDate: DateTime.parse(json["eventDate"]),
    eventName: json["eventName"],

  );

  Map<String, dynamic> toJson() => {
    "eventDate": eventDate,
    "eventName": eventName,
  };
}
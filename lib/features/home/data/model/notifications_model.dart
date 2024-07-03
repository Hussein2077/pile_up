class NotificationModel {
  final String text;
  final String image;

  NotificationModel({
    required this.text,
    required this.image,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      text: json['text'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'image': image,
    };
  }
}

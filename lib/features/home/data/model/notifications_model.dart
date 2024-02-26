class Notification {
  final String text;
  final String image;

  Notification({
    required this.text,
    required this.image,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
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

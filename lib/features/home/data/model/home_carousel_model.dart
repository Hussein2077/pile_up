class HomeCarousel {
  final int slideId;
  final String imageUrl;
  final String caption;
  final int orderInCarousel;

  HomeCarousel({
    required this.slideId,
    required this.imageUrl,
    required this.caption,
    required this.orderInCarousel,
  });

  factory HomeCarousel.fromJson(Map<String, dynamic> json) => HomeCarousel(
    slideId: json["slideId"],
    imageUrl: json["imageUrl"],
    caption: json["caption"],
    orderInCarousel: json["orderInCarousel"],
  );

  Map<String, dynamic> toJson() => {
    "slideId": slideId,
    "imageUrl": imageUrl,
    "caption": caption,
    "orderInCarousel": orderInCarousel,
  };
}
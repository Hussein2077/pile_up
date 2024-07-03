class HomeCarousel {
  final int slideId;
  final String imageUrl;


  HomeCarousel({
    required this.slideId,
    required this.imageUrl,

  });

  factory HomeCarousel.fromJson(Map<String, dynamic> json) => HomeCarousel(
    slideId: json["id"],
    imageUrl: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": imageUrl,

  };
}
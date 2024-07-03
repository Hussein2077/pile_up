class Merchant {
  final int merchantId;
  final String name;
  final String description;
  final String contactInfo;
  final int discount;
  final String website;
  final String logo;

  Merchant({
    required this.merchantId,
    required this.name,
    required this.description,
    required this.contactInfo,
    required this.discount,
    required this.website,
    required this.logo,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    merchantId: json["merchantId"],
    name: json["name"],
    description: json["description"],
    contactInfo: json["contactInfo"],
    discount: json["discount"],
    website: json["website"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "merchantId": merchantId,
    "name": name,
    "description": description,
    "contactInfo": contactInfo,
    "discount": discount,
    "website": website,
    "logo": logo,
  };
}
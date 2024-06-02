class Vendor {
  final int vendorId;
  final String name;
  final String description;
  final String contactInfo;
  final int discount;
  final String website;
  final String logo;

  Vendor({
    required this.vendorId,
    required this.name,
    required this.description,
    required this.contactInfo,
    required this.discount,
    required this.website,
    required this.logo,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    vendorId: json["vendorId"],
    name: json["name"],
    description: json["description"],
    contactInfo: json["contactInfo"],
    discount: json["discount"],
    website: json["website"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "vendorId": vendorId,
    "name": name,
    "description": description,
    "contactInfo": contactInfo,
    "discount": discount,
    "website": website,
    "logo": logo,
  };
}
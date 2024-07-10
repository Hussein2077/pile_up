class AddressBookModel {
  final bool hasAccount;
  final int contactUserId;
  final String name;
  final String email;
  final String phoneNumber;
  final int userId;
  final int id;

  AddressBookModel({
    required this.hasAccount,
    required this.contactUserId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.userId,
    required this.id,
  });

  factory AddressBookModel.fromJson(Map<String, dynamic> json) {
    return AddressBookModel(
      hasAccount: json['has_account'] == 1,
      contactUserId: json['contact_user_id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      userId: json['user_id'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_account': hasAccount,
      'contact_user_id': contactUserId,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'user_id': userId,
      'id': id,
    };
  }
}

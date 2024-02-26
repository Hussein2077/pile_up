class MyProfile {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String password;
  final String reminder;

  MyProfile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.reminder,
  });

  factory MyProfile.fromJson(Map<String, dynamic> json) => MyProfile(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    password: json["password"],
    reminder: json["reminder"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobileNumber": mobileNumber,
    "password": password,
    'reminder' : reminder,
  };
}
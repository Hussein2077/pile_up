class MyProfile {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  int? reminder;
  int? myPiles;

  int? myWallet;
  int? pilesIAmIn;
  static MyProfile? _instance;

  MyProfile._internal({
    required this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.reminder,
    this.myPiles,
    this.myWallet,
    this.pilesIAmIn,
  });

  factory MyProfile({
    int? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? reminder,
    int? myPiles,
    int? myWallet,
    int? pilesIAmIn,
  }) {
    if (_instance == null) {
      _instance = MyProfile._internal(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        mobileNumber: mobileNumber,
        reminder: reminder,
        myPiles: myPiles,
        myWallet: myWallet,
        pilesIAmIn: pilesIAmIn,

      );
    } else {
      _instance?.updateProfile(
        firstName: firstName,
        lastName: lastName,
        email: email,
        mobileNumber: mobileNumber,
        reminder: reminder,
        myPiles: myPiles,
        myWallet: myWallet,
        pilesIAmIn: pilesIAmIn,
      );
    }
    return _instance!;
  }

  void updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? reminder,
    int? myPiles,
    int? myWallet,
    int? pilesIAmIn,
  }) {
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.email = email ?? this.email;
    this.mobileNumber = mobileNumber ?? this.mobileNumber;
    this.reminder = reminder ?? this.reminder;
    this.myPiles = myPiles ?? this.myPiles;
    this.myWallet = myWallet ?? this.myWallet;
    this.pilesIAmIn = pilesIAmIn ?? this.pilesIAmIn;
  }

  void clearObject() {
    _instance = null;
  }

  factory MyProfile.fromJson(Map<String, dynamic> json) {
    if (_instance == null) {
      _instance = MyProfile._internal(
        userId: json["id"],
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        mobileNumber: json["phone_number"],
        reminder: json["pile_reminder"] ?? 0,
        myPiles: json["piles_count"] ?? 0,
        myWallet: json["my_wallet"] ?? 0,
        pilesIAmIn: json["piles_im_in_count"] ?? 0,
      );
    } else {
      _instance?.updateProfile(
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        mobileNumber: json["phone_number"],
        reminder: json["pile_reminder"] ?? 0,
        myPiles: json["piles_count"] ?? 0,
        myWallet: json["my_wallet"] ?? 0,
        pilesIAmIn: json["piles_im_in_count"] ?? 0,
      );
    }
    return _instance!;
  }

  static MyProfile getInstance() {
    return _instance ?? MyProfile();
  }
}

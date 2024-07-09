import 'package:equatable/equatable.dart';
class Participant extends Equatable {
  final String firstName;
  final String lastName;
  final String? email;
  final String phoneNumber;
  final int participatedAmount;
  final DateTime date;

  const Participant({
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phoneNumber,
    required this.participatedAmount,
    required this.date,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      participatedAmount: json['participated_amount'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'participated_amount': participatedAmount,
      'date': date.toIso8601String(),
    };
  }

  @override

  List<Object?> get props => [  firstName,  lastName,  email,  phoneNumber,  participatedAmount,  date];
}

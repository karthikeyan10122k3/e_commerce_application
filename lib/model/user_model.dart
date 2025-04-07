class UserModel {
  String? firstName;
  String? lastName;
  String username;
  String email;
  int mobile;
  String dob;
  String? gender;
  String? country;
  String? state;
  String? city;
  int? zipCode;
  bool? isVerified;

  UserModel({
    this.firstName,
    this.lastName,
    required this.username,
    required this.email,
    required this.mobile,
    required this.dob,
    this.gender,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.isVerified = false,
  });
}

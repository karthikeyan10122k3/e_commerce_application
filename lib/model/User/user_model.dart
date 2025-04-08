class UserModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  String? email;
  int? mobile;
  String? dob;
  String? gender;
  String? country;
  String? state;
  String? city;
  int? zipCode;
  bool? isVerified;

  UserModel({
    this.firstName = '',
    this.lastName = '',
    this.userName = '', //Screen 4 pending
    this.password = '', //Screen 4 pending
    this.email = '', //Screen 4 pending
    this.mobile,
    this.dob = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
    this.zipCode,
    this.isVerified = false,
  });

  @override
  String toString() {
    return 'FirstName: $firstName, LastName: $lastName, Username: $userName, email: $email, mobile: $mobile, dob: $dob, gender: $gender, Country: $country, State: $state, City: $city, ZipCode: $zipCode, IsVerified: $isVerified ';
  }
}

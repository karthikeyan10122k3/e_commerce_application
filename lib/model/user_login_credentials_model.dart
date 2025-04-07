class UserLoginCredentialsModel {
  String userName;
  String password;

  UserLoginCredentialsModel({required this.userName, required this.password}) {}

  @override
  String toString() {
    return 'Username: $userName, Password: $password';
  }
}

import 'package:e_commerce_application/model/User/user_cart_model.dart';
import 'package:e_commerce_application/model/User/user_orders_model.dart';

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
  List<UserOrdersModel> userOrders;
  List<UserCartModel> userCartItems;

  UserModel({
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.password = '',
    this.email = '',
    this.mobile,
    this.dob = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
    this.zipCode = 0,
    this.isVerified = false,
    List<UserOrdersModel>? userOrders,
    List<UserCartModel>? userCartItems,
  }) : userOrders = userOrders ?? [],
       userCartItems = userCartItems ?? [];

  @override
  String toString() {
    return 'FirstName: $firstName, LastName: $lastName, Username: $userName, email: $email, mobile: $mobile, dob: $dob, gender: $gender, Country: $country, State: $state, City: $city, ZipCode: $zipCode, IsVerified: $isVerified ';
  }
}

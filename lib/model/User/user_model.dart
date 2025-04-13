import 'package:e_commerce_application/model/User/user_cart_model.dart';
import 'package:e_commerce_application/model/User/user_orders_model.dart';

enum UserRole { customer, admin }

class UserModel {
  String userId;
  String firstName;
  String lastName;
  String userName;
  String password;
  String email;
  UserRole role;
  String mobile;
  String dob;
  String gender;
  String country;
  String state;
  String city;
  String zipCode;
  bool isVerified;
  List<UserOrdersModel> userOrders;
  List<UserCartModel> userCartItems;

  UserModel({
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.password = '',
    this.email = '',
    this.role = UserRole.customer,
    this.mobile = '',
    this.dob = '',
    this.gender = '',
    this.country = '',
    this.state = '',
    this.city = '',
    this.zipCode = '',
    this.isVerified = false,
    List<UserOrdersModel>? userOrders,
    List<UserCartModel>? userCartItems,
  }) : userOrders = userOrders ?? [],
       userCartItems = userCartItems ?? [];

  @override
  String toString() {
    return 'FirstName: $firstName, LastName: $lastName, Username: $userName, email: $email, mobile: $mobile, dob: $dob, gender: $gender, Country: $country, State: $state, City: $city, ZipCode: $zipCode, IsVerified: $isVerified, Role: ${role.name}';
  }
}

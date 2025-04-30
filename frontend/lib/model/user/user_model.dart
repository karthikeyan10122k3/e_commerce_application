import 'package:e_commerce_application/model/cart/cart_model.dart';
import 'package:e_commerce_application/model/orders/orders_model.dart';

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
  List<OrderItemModel> userOrders;
  List<CartItemModel> userCartItems;

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
    List<OrderItemModel>? userOrders,
    List<CartItemModel>? userCartItems,
  }) : userOrders = userOrders ?? [],
       userCartItems = userCartItems ?? [];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userName: json['userName'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] == 'admin' ? UserRole.admin : UserRole.customer,
      mobile: json['mobile'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      zipCode: json['zipCode'] ?? '',
      isVerified: json['isVerified'] ?? false,
      userOrders:
          (json['userOrders'] as List<dynamic>?)
              ?.map((e) => OrderItemModel.fromJson(e))
              .toList() ??
          [],
      userCartItems:
          (json['userCartItems'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'email': email,
      'role': role.name,
      'mobile': mobile,
      'dob': dob,
      'gender': gender,
      'country': country,
      'state': state,
      'city': city,
      'zipCode': zipCode,
      'isVerified': isVerified,
      'userOrders': userOrders.map((e) => e.toJson()).toList(),
      'userCartItems': userCartItems.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'FirstName: $firstName, LastName: $lastName, Username: $userName, email: $email, mobile: $mobile, dob: $dob, gender: $gender, Country: $country, State: $state, City: $city, ZipCode: $zipCode, IsVerified: $isVerified, Role: ${role.name}';
  }
}

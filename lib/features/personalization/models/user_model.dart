import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

///Model class representing user data

class UserModel {
  //keep those values final which you do not want to update
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructor for userModel
  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required List<dynamic> addresses});

  //Helper function to get fullname.
  String get fullName => '$firstname $lastname';

  //helper function to format phonenumber
  String get formattedPhoneNo => PFormatter.formatPhoneNumber(phoneNumber);

  //static function to split fullname into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //static function to generate username from full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; //combine firstname and lastname
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //static function to create an empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstname: '',
        lastname: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        addresses: [],
      );

  //Convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //Factory method to create a UserModel from a Firebase documet dashboard
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) ;
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstname: data['FirstName'] ?? '',
      lastname: data['LastName'] ?? '',
      username: data['Username'] ?? '',
      email: data['Email'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
      addresses: [] ?? [],
    );
  }
}

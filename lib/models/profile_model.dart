import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsanbercode/models/address_model.dart';

class ProfileModel {
  String? email;
  String? firstName;
  String? lastName;
  AddressModel? address;
  bool? accountStatus;
  String? linkedIn;
  String? instagram;
  String? website;

  ProfileModel({
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.accountStatus,
    this.linkedIn,
    this.instagram,
    this.website,
  });

  ProfileModel.fromDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    email = snapshot['Email'];
    firstName = snapshot['Firstname'];
    lastName = snapshot['Lastname'];
    address = AddressModel.fromJson(snapshot['Address']);
    accountStatus = snapshot['Account Status'];
    linkedIn = snapshot['LinkedIn'];
    instagram = snapshot['Instagram'];
    website = snapshot['Website'];
  }
}

class AddressModel {
  String? address1;
  String? address2;
  String? city;
  String? region;

  AddressModel({this.address1, this.address2, this.city, this.region});

  AddressModel.fromJson(json) {
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    region = json['Region'];
  }
}

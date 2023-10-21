class CustomersModel {
  final int id;
  final int customerMobileNumber;
  final String name;
  final String address;
  final String city;
  final dynamic password;

  // constractor
  CustomersModel({
    required this.id,
    required this.customerMobileNumber,
    required this.name,
    required this.address,
    required this.city,
    required this.password,
  });

  //use toGet data from internet

  factory CustomersModel.fromJson(jsonData) {
    return CustomersModel(
      id: jsonData['id'],
      customerMobileNumber: jsonData['customerMobileNumber'],
      name: jsonData['name'],
      address: jsonData['address'],
      city: jsonData['city'],
      password: jsonData['password'],
    );
  }
}

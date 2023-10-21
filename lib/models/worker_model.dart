class WorkerModel{

  final int id;
  final int workerMobileNumber;
  final String worker_name;
  final String address;
  final String city;
  final String craft;
  final dynamic password;

  // constractor
  WorkerModel({
    required this.id,
    required this.workerMobileNumber,
    required this.worker_name,
    required this.address,
    required this.city,
    required this.craft,
    required this.password,
  });

  //use toGet data from internet

  factory WorkerModel.fromJson(jsonData) {
    return WorkerModel(
      id: jsonData['id'],
      workerMobileNumber: jsonData['workerMobileNumber'],
      worker_name: jsonData['name'],
      address: jsonData['address'],
      city: jsonData['city'],
      craft: jsonData['craft'],
      password: jsonData['password'],
    );
  }

}
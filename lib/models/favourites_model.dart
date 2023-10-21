class FavouritesModel{

  final int id;
  final int customerMobileNumber;
  final int workerMobileNumber;
  final String craft;



  // constractor
  FavouritesModel({
    required this.id,
    required this.customerMobileNumber,
    required this.workerMobileNumber,
    required this.craft,

  });

  //use toGet data from internet

  factory FavouritesModel.fromJson(jsonData) {
    return FavouritesModel(
      id: jsonData['id'],
      customerMobileNumber: jsonData['customerMobileNumber'],
      workerMobileNumber: jsonData['workerMobileNumber'],
      craft: jsonData['craft'],


    );
  }

}
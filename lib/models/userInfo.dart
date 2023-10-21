class UserInfo {

  String? mobile_number ,customer_name , customer_address , customer_city  , customer_password , worker_nameInOrder , worker_MobileNumberInOrder ;



  static final UserInfo _singleton = UserInfo._internal();

  factory UserInfo() {
    return _singleton;
  }

  UserInfo._internal();
}
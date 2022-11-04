part of 'SP_service.dart';

class UserData {
  static const String logstatus = "_statuslog_str";
  static const String userIdStr = "user_id_str";
  static const String userNameStr = "user_name_str";
  static const String userEmailStr = "user_email_str";
  static const String userAddressStr = "user_address_str";
  static const String userPhoneStr = "user_phone_str";
  static const String userPassStr = "password_str";
  static const String isAdminStr = "is_admin_str";
  static const String usernameStr = "username_str";
  static const String userPicurlStr = "userpic_url_str";
  static const String userTokenStr = "user_token_str";

  static bool _isAdmin = false;
  static bool _statuslog = false;
  static String _userName = '';
  static String _userNameOfUser = '';
  static String _userAdress = '';
  static String _userEmail = '';
  static String _userPassword = '';
  static String _userPhone = '';
  static String _userPicUrl = '';
  static String _userID = '';
  static late String _userToken;

  bool getAdminStatus() {
    return _isAdmin;
  }

  bool getStatusLog() {
    return _statuslog;
  }

  String getUserToken() {
    return _userToken;
  }

  String getUserPassword() {
    return _userPassword;
  }

  String getUserID() {
    return _userID;
  }

  String getUsernameID() {
    return _userName;
  }

  String getnameofUser() {
    return _userNameOfUser;
  }

  String getEmail() {
    return _userEmail;
  }

  String getPhone() {
    return _userPhone;
  }

  String getPicurl() {
    return _userPicUrl;
  }

  String getAdress() {
    return _userAdress;
  }

  void printdevinfo() {
    print("\n\n======[info]=======]");
    print("ID       : $_userID");
    print("Username : $_userName");
    print("Name     : $_userNameOfUser");
    print("token     : $_userToken");
    // print("Email    : $_userEmail");
    // print("Phone    : $_userPhone");
    // print("adress   : $_userAdress");
    // print("Password : $_userPassword");
    // print("Pic URL  : $_userPicUrl");
    // print("Log stat : $_statuslog");
    // print("Admin    : $_isAdmin");
  }

  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    const String nodata = 'No Data Avail';
    pref.setString(UserData.userIdStr, nodata);
    pref.setString(UserData.usernameStr, nodata);
    pref.setString(UserData.userNameStr, nodata);
    pref.setString(UserData.userEmailStr, nodata);
    pref.setString(UserData.userPassStr, nodata);
    pref.setString(UserData.userPhoneStr, nodata);
    pref.setString(UserData.userPicurlStr, nodata);
    pref.setString(UserData.userAddressStr, nodata);
    pref.setString(UserData.userTokenStr, nodata);
    pref.setBool(UserData.isAdminStr, false);
    pref.setBool(UserData.logstatus, false);
    await getPref();
    print('[Account dev] : Data wiped out');
    printdevinfo();
    return;
  }

  Future<void> setUser({required Map data}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(UserData.logstatus, true);
    pref.setString(
        UserData.userIdStr, data['data']['user_id'] ?? 'No data avail');
    pref.setString(
        UserData.usernameStr, data['data']['username'] ?? 'No Data avail');
    pref.setString(
        UserData.userAddressStr, data['subdivisi'] ?? 'No Data avail');
    pref.setString(
        UserData.userTokenStr, data['access_token'] ?? 'No Data avail');
    // if (data['akses'] == 'adm') {
    //   pref.setBool(UserData.isAdmin_str, true);
    // } else {
    //   pref.setBool(UserData.isAdmin_str, false);
    // }
    await getPref();
    print('[LOGIN INFO] : Updated..!');
    printdevinfo();
    return;
  }

  Future<void> getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _userID = pref.getString(userIdStr).toString();
    _userName = pref.getString(usernameStr).toString();
    _userNameOfUser = pref.getString(userNameStr).toString();
    _userPassword = pref.getString(userPassStr).toString();
    _userEmail = pref.getString(userEmailStr).toString();
    _userPicUrl = pref.getString(userPicurlStr).toString();
    _userPhone = pref.getString(userPhoneStr).toString();
    _userAdress = pref.getString(userAddressStr).toString();
    _userToken = pref.getString(userTokenStr).toString();
    if (pref.getBool(logstatus) == null || pref.getBool(logstatus) == false) {
      _statuslog = false;
    } else {
      _statuslog = true;
    }
    if (pref.getBool(isAdminStr) == null || pref.getBool(isAdminStr) == false) {
      _isAdmin = false;
    } else {
      _isAdmin = true;
    }
    return;
  }
}

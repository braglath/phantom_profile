import 'package:get_storage/get_storage.dart';
import 'package:phantom/app/data/services/model/login_model.dart';

import '../services/model/user_model.dart';

class UserLoggedIn {
  final _userLoggedInBox = GetStorage();
  final _userLoggedInKey = 'userLoggedIn';

  // ? check user logged-in or not
  bool checkIsUserLoggedIn() =>
      _userLoggedInBox.read(_userLoggedInKey) ?? false;
  // ? write user logged in or logged out
  Future<void> userLoggedIn(bool userLoggedIn) =>
      _userLoggedInBox.write(_userLoggedInKey, userLoggedIn);
}

class RememberUser {
  final _rememberUserBox = GetStorage();
  final _rememberUserKey = 'rememberUser';

  // ? check to remember user
  bool checkRememberUser() =>
      _rememberUserBox.read<bool>(_rememberUserKey) ?? false;
  // ? write remember user
  Future<void> rememberUser(bool rememberUser) =>
      _rememberUserBox.write(_rememberUserKey, rememberUser);
}

class UserDetails {
  final _userTokenBox = GetStorage();
  final _userNameBox = GetStorage();
  final _userPhoneBox = GetStorage();
  final _userEmailBox = GetStorage();
  final _userProfilePicBox = GetStorage();
  final _userDOBBox = GetStorage();
  final _userGenderBox = GetStorage();
  final _userAddressBox = GetStorage();
  final _userDesignationBox = GetStorage();
  final _userCompanyBox = GetStorage();
  final _userDepartmentBox = GetStorage();

  final _userTokenKey = 'userToken';
  final _userNameKey = 'userName';
  final _userPhoneKey = 'userPhoneNumber';
  final _userEmailKey = 'userEmail';
  final _userProfilePicKey = 'userProfilePic';
  final _userDOBKey = 'userDOB';
  final _userGenderKey = 'userGender';
  final _userAddressKey = 'userAddress';
  final _userDesignationKey = 'userDesignation';
  final _userCompanyKey = 'userCompany';
  final _userDepartmentKey = 'userDepartment';

  // ? write user details /////////////////////////////////
  Future<void> saveUserTokenToBox(String userToken) =>
      _userTokenBox.write(_userTokenKey, userToken);

  Future<void> saveUserNameToBox(String userName) =>
      _userNameBox.write(_userNameKey, userName);

  Future<void> saveUserPhoneToBox(String userPhone) =>
      _userPhoneBox.write(_userPhoneKey, userPhone);

  Future<void> saveUserEmailToBox(String userEmail) =>
      _userEmailBox.write(_userEmailKey, userEmail);

  Future<void> saveUserProfilePicToBox(String userProfilePic) =>
      _userProfilePicBox.write(_userProfilePicKey, userProfilePic);

  Future<void> saveUserDOB(String userDOB) =>
      _userDOBBox.write(_userDOBKey, userDOB);

  Future<void> saveUserGender(String userGender) =>
      _userGenderBox.write(_userGenderKey, userGender);

  Future<void> saveUserAddress(String userAddress) =>
      _userAddressBox.write(_userAddressKey, userAddress);

  Future<void> saveUserDesignation(String userDesignation) =>
      _userDesignationBox.write(_userDesignationKey, userDesignation);

  Future<void> saveUserCompany(String userCompany) =>
      _userCompanyBox.write(_userCompanyKey, userCompany);

  Future<void> saveUserDepartment(String userDepartment) =>
      _userDepartmentBox.write(_userDepartmentKey, userDepartment);

///////////////////////////////////////////////////////////////////////

  // ? read user details
  String readUserTokenFromBox() => _userTokenBox.read(_userTokenKey);
  String readUserNameFromBox() => _userNameBox.read(_userNameKey);
  String readUserPhoneFromBox() => _userPhoneBox.read(_userPhoneKey);
  String readUserEmailFromBox() => _userEmailBox.read(_userEmailKey);
  String readUserProfilePicFromBox() =>
      _userProfilePicBox.read(_userProfilePicKey);
  String readUserDOB() => _userDOBBox.read(_userDOBKey);
  String readUserGenderFromBox() => _userGenderBox.read(_userGenderKey);
  String readUserAddressFromBox() => _userAddressBox.read(_userAddressKey);
  String readUserDesignationFromBox() =>
      _userDesignationBox.read(_userDesignationKey);
  String readUserCompanyFromBox() => _userCompanyBox.read(_userCompanyKey);
  String readUserDepartmentFromBox() =>
      _userDepartmentBox.read(_userDepartmentKey);

  Future<UserModel> readUserDetails() async {
    final username = UserDetails().readUserNameFromBox();
    final phone = UserDetails().readUserPhoneFromBox();
    final email = UserDetails().readUserEmailFromBox();
    final dob = UserDetails().readUserDOB();
    final gender = UserDetails().readUserGenderFromBox();
    final address = UserDetails().readUserAddressFromBox();
    final designation = UserDetails().readUserDesignationFromBox();
    final company = UserDetails().readUserCompanyFromBox();
    final department = UserDetails().readUserDepartmentFromBox();

    return UserModel(
        username: username,
        email: email,
        phone: phone,
        gender: gender,
        address: address,
        designation: designation,
        company: company,
        department: department,
        dob: DateTime.parse(dob));
  }

  // ? delete user details
  Future<void> deleteUserDetailsFromBox() async {
    await _userTokenBox.erase();
    await _userNameBox.erase();
    await _userPhoneBox.erase();
    await _userEmailBox.erase();
    await _userProfilePicBox.erase();
    await _userDOBBox.erase();
    await _userGenderBox.erase();
    await _userAddressBox.erase();
    await _userDesignationBox.erase();
    await _userCompanyBox.erase();
    await _userDepartmentBox.erase();
    await UserLoggedIn().userLoggedIn(false);
    await RememberUser().rememberUser(false);
  }

  // ? save user details
  Future<void> saveUserDetailsToBox(
      {required String token,
      required String name,
      required String phone,
      required String email,
      required String profilePic,
      required DateTime userDOB,
      required String userGender,
      required String userAddress,
      required String userDesignation,
      required String userCompany,
      required String userDepartment,
      required bool isUserLoggedIn,
      required bool isRememberUser}) async {
    await saveUserTokenToBox(token);
    await saveUserNameToBox(name);
    await saveUserPhoneToBox(phone);
    await saveUserEmailToBox(email);
    await saveUserProfilePicToBox(profilePic);
    await saveUserDOB(userDOB.toString());
    await saveUserGender(userGender);
    await saveUserAddress(userAddress);
    await saveUserDesignation(userDesignation);
    await saveUserCompany(userCompany);
    await saveUserDepartment(userDepartment);
    await UserLoggedIn().userLoggedIn(isUserLoggedIn);
    await RememberUser().rememberUser(isRememberUser);
  }
}

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:phantom/app/data/localStorage/user_data.dart';
import 'package:phantom/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    conditionalNavigation();
  }

  /// ## condition navigation after delay
  /// * after 3 second delay
  /// * check user clicked on remember me before from local storage
  /// * if false, then navigate to login screen
  /// * if true, then check jwt expiration
  /// * if token expired, navigate to login screen
  /// * if not expired, navigate to home screen
  void conditionalNavigation() {
    Future.delayed(const Duration(seconds: 3), () async {
      // check Remember me
      // if remember me is true check jwt else remove all from local storage and navigate to login
      final _isRememberUser = RememberUser().checkRememberUser();
      if (!_isRememberUser) {
        await UserDetails().deleteUserDetailsFromBox();
        Get.offNamed(Routes.LOGIN);
      } else {
        // user remember me checked
        // check JWT token here
        final _token = UserDetails().readUserTokenFromBox();
        bool _isValid = JwtDecoder.isExpired(_token);
        // if token expired navigate to login page else to profile page
        !_isValid ? Get.offNamed(Routes.PROFILE) : Get.offNamed(Routes.LOGIN);
      }
    });
  }
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:phantom/app/data/resources/color_resources.dart';

Future<void> showToast({required String message}) async {
  await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorResources.black,
    textColor: ColorResources.white,
    fontSize: 16.0,
  );
}

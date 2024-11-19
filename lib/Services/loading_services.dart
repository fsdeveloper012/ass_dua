import 'package:flutter_easyloading/flutter_easyloading.dart';

class InitLoading {
  void showLoading(String msg) {
    EasyLoading.show(status: msg);
  }

  void dismissLoading() {
    EasyLoading.dismiss();
  }
}

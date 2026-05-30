
import 'package:get/get.dart';

validinput(String value, int max, int min, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return "username not valid";
    }
  }

    else if (type == "email") {
      if (!GetUtils.isEmail(value)) {
        return " Email not valid";
      }
    }

    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(value)) {
        return " Phone not valid ";
      }
    }


 else if (value.length > max) {
    return "value less than $max";
  }

 else if (value.length < min) {
    return 'the value larger than $min';
  }
}

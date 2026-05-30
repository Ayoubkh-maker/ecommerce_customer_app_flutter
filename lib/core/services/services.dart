
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// hadi class ykhali tatla3ana lhaja lwla f app 
class Myservices extends GetxService {

late SharedPreferences sharedPreferences ;

Future<Myservices> init() async{
//  await Firebase.initializeApp();
 sharedPreferences = await SharedPreferences.getInstance();
return this ;
}

}

Future initialServices()async{
await Get.putAsync(() =>Myservices().init());
}

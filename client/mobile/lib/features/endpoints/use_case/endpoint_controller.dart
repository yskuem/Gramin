
import 'package:flutter_app_template/features/endpoints/constant/constant.dart';

class EndPointController {
  EndPointController._();

  static String getGenerateQuizEndPoint() {
    const flavor = String.fromEnvironment('flavor');
    if(flavor == 'prod') {
      return quizGenerateEndpointForProd;
    } else {
      return quizGenerateEndpointForDev;
    }
  }
}



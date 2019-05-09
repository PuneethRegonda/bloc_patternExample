import 'dart:async';

import 'package:bloc_pattern/validator/validator.dart';

class Bloc extends Validator {
  StreamController emailController=StreamController<String>();
  StreamController passwordController=StreamController<String>();

  ///we know [StreamController]
  ///has [Stream], [Sink]
  ///
  /// Using getter i do these

  //this for retriving the data form the stream

  Stream<String>  get email=> emailController.stream.transform(validatorEmail);
  Stream<String>  get password=>passwordController.stream.transform(validatorPass);

  //this getter helps us to get tghe access to the sink
  //which has add ....

  Function(String) get emailChange=>emailController.sink.add;
  Function(String) get passwordChange=>passwordController.sink.add;


  dispose(){
    emailController.close();
    passwordController.close();
  }

}
final bloc=Bloc();
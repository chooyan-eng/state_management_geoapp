import 'package:state_management_geoapp/bloc/main.dart';
import 'package:state_management_geoapp/getx/main.dart';
import 'package:state_management_geoapp/global_variables/main.dart';
import 'package:state_management_geoapp/mobx/main.dart';
import 'package:state_management_geoapp/provider/main.dart';
import 'package:state_management_geoapp/redux/main.dart';
import 'package:state_management_geoapp/riverpod/main.dart';
import 'package:state_management_geoapp/standard/main.dart';

enum StateManagementApproach {
  standart,
  provider,
  riverpod,
  bloc,
  getx,
  mobx,
  redux,
  globalVariables, // not recommended!
}

// change here for selecting an approach
const approach = StateManagementApproach.redux;

void main() {
  switch (approach) {
    case StateManagementApproach.standart:
      standardMain();
    case StateManagementApproach.provider:
      providerMain();
    case StateManagementApproach.riverpod:
      riverpodMain();
    case StateManagementApproach.bloc:
      blocMain();
    case StateManagementApproach.getx:
      getxMain();
    case StateManagementApproach.mobx:
      mobxMain();
    case StateManagementApproach.redux:
      reduxMain();
    case StateManagementApproach.globalVariables:
      globalVariablesMain();
  }
}

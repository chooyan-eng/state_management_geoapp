import 'package:state_management_geoapp/getx/main.dart';
import 'package:state_management_geoapp/global_variables/main.dart';
import 'package:state_management_geoapp/mobx/main.dart';
import 'package:state_management_geoapp/provider/main.dart';
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
const approach = StateManagementApproach.mobx;

void main() {
  switch (approach) {
    case StateManagementApproach.standart:
      standardMain();
    case StateManagementApproach.provider:
      providerMain();
    case StateManagementApproach.riverpod:
      riverpodMain();
    case StateManagementApproach.bloc:
    case StateManagementApproach.getx:
      getxMain();
    case StateManagementApproach.mobx:
      mobxMain();
    case StateManagementApproach.redux:
    case StateManagementApproach.globalVariables:
      globalVariablesMain();
  }
}

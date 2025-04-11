import 'package:flutter/material.dart';

import '../bloc/app_bloc.dart';

class VPNStatusModel extends InheritedModel<bool> {
  const VPNStatusModel({super.key, required this.status, required this.tick, required super.child});

  final VPNStatus? status;
  final int? tick;

  static VPNStatusModel? maybeOf(BuildContext context) {
    return InheritedModel.inheritFrom<VPNStatusModel>(context);
  }

  static VPNStatusModel? of(BuildContext context) {
    final VPNStatusModel? result = maybeOf(context);
    assert(result != null, 'Unable to find an instance of VPNStatusModel...');
    return result!;
  }

  static VPNStatus? statusOf(BuildContext context) {
    return InheritedModel.inheritFrom<VPNStatusModel>(context)?.status;
  }

  static int tickOf(BuildContext context) {
    return InheritedModel.inheritFrom<VPNStatusModel>(context)?.tick ?? 0;
  }

  @override
  bool updateShouldNotify(VPNStatusModel oldWidget) {
    return status != oldWidget.status;
  }

  @override
  bool updateShouldNotifyDependent(VPNStatusModel oldWidget, Set<bool> dependencies) {
    if (status != oldWidget.status) {
      return true;
    }

    return false;
  }
}

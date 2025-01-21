import 'package:get/get.dart';

RxBool id = false.obs;

enum Period {
  monthly,
  quarterly,
  semiAnnual,
  yearly,
}

extension PeriodExtension on Period {
  String get name {
    switch (this) {
      case Period.monthly:
        return 'شهري';
      case Period.quarterly:
        return 'ربع سنوي';
      case Period.semiAnnual:
        return 'نصف سنوي';
      case Period.yearly:
        return 'سنوي';
      default:
        return '';
    }
  }
}

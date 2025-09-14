import 'package:intl/intl.dart';

class CalculationService {
  static Map<String, DateTime> calculateWithdrawalDates(DateTime administeredDate) {
    // Default withdrawal periods (in days)
    const int meatWithdrawalDays = 30;
    const int dairyWithdrawalDays = 7;

    return {
      'meat': administeredDate.add(Duration(days: meatWithdrawalDays)),
      'dairy': administeredDate.add(Duration(days: dairyWithdrawalDays)),
    };
  }

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
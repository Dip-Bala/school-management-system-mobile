import '../models/attendance_model.dart';

class AttendanceService {
  Future<List<AttendanceModel>> fetchAttendanceByDate(DateTime date) async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<void> markAttendance(AttendanceModel attendance) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

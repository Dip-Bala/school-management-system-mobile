import '../models/attendance_model.dart';
import '../services/attendance_service.dart';

class AttendanceRepository {
  final AttendanceService _service;
  
  AttendanceRepository({AttendanceService? service}) : _service = service ?? AttendanceService();

  Future<List<AttendanceModel>> getAttendanceByDate(DateTime date) => _service.fetchAttendanceByDate(date);
  Future<void> markAttendance(AttendanceModel attendance) => _service.markAttendance(attendance);
}

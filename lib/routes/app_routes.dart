import 'package:flutter/material.dart';
import '../core/constants/route_constants.dart';

// Auth Screens
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/otp_verification_screen.dart';
import '../features/auth/presentation/screens/set_new_password_screen.dart';
import '../features/auth/presentation/screens/success_screen.dart';

// Home Screens
import '../features/home/presentation/screens/home_screen.dart';
import '../features/home/presentation/screens/role_selection_screen.dart';

// Student Screens
import '../features/student/presentation/screens/student_dashboard_screen.dart';
import '../features/student/presentation/screens/student_list_screen.dart';
import '../features/student/presentation/screens/student_detail_screen.dart';
import '../features/student/presentation/screens/student_profile_screen.dart';
import '../features/student/presentation/screens/add_edit_student_screen.dart';

// Teacher Screens
import '../features/teacher/presentation/screens/teacher_dashboard_screen.dart';
import '../features/teacher/presentation/screens/teacher_list_screen.dart';
import '../features/teacher/presentation/screens/teacher_detail_screen.dart';
import '../features/teacher/presentation/screens/teacher_profile_screen.dart';
import '../features/teacher/presentation/screens/add_edit_teacher_screen.dart';

// Class Screens
import '../features/class/presentation/screens/class_list_screen.dart';
import '../features/class/presentation/screens/timetable_screen.dart';

// Attendance Screens
import '../features/attendance/presentation/screens/mark_attendance_screen.dart';
import '../features/attendance/presentation/screens/attendance_report_screen.dart';

// Assignment Screens
import '../features/assignment/presentation/screens/assignment_list_screen.dart';
import '../features/assignment/presentation/screens/create_assignment_screen.dart';

// Notification Screens
import '../features/notifications/presentation/screens/notifications_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        
      case RouteConstants.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        
      case RouteConstants.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        
      case RouteConstants.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
        
      case RouteConstants.otpVerification:
        final emailOrPhone = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => OTPVerificationScreen(emailOrPhone: emailOrPhone),
        );
        
      case RouteConstants.setNewPassword:
        return MaterialPageRoute(builder: (_) => const SetNewPasswordScreen());
        
      case RouteConstants.successScreen:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
        
      // Home Routes
      case RouteConstants.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        
      case RouteConstants.roleSelection:
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
        
      // Student Routes
      case RouteConstants.studentDashboard:
        return MaterialPageRoute(builder: (_) => const StudentDashboardScreen());
        
      case RouteConstants.studentList:
        return MaterialPageRoute(builder: (_) => const StudentListScreen());
        
      case RouteConstants.studentDetail:
        final studentId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => StudentDetailScreen(studentId: studentId),
        );
        
      case RouteConstants.studentProfile:
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());
        
      case RouteConstants.addStudent:
        return MaterialPageRoute(builder: (_) => const AddEditStudentScreen());
        
      // Teacher Routes
      case RouteConstants.teacherDashboard:
        return MaterialPageRoute(builder: (_) => const TeacherDashboardScreen());
        
      case RouteConstants.teacherList:
        return MaterialPageRoute(builder: (_) => const TeacherListScreen());
        
      case RouteConstants.teacherDetail:
        final teacherId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => TeacherDetailScreen(teacherId: teacherId),
        );
        
      case RouteConstants.teacherProfile:
        return MaterialPageRoute(builder: (_) => const TeacherProfileScreen());
        
      case RouteConstants.addTeacher:
        return MaterialPageRoute(builder: (_) => const AddEditTeacherScreen());
        
      // Class Routes
      case RouteConstants.classList:
        return MaterialPageRoute(builder: (_) => const ClassListScreen());
        
      case RouteConstants.timetable:
        return MaterialPageRoute(builder: (_) => const TimetableScreen());
        
      // Attendance Routes
      case RouteConstants.markAttendance:
        return MaterialPageRoute(builder: (_) => const MarkAttendanceScreen());
        
      case RouteConstants.attendanceReport:
        return MaterialPageRoute(builder: (_) => const AttendanceReportScreen());
        
      // Assignment Routes
      case RouteConstants.assignments:
        return MaterialPageRoute(builder: (_) => const AssignmentListScreen());
        
      case RouteConstants.createAssignment:
        return MaterialPageRoute(builder: (_) => const CreateAssignmentScreen());
        
      // Notification Routes
      case RouteConstants.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

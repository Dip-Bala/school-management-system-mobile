import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/route_constants.dart';
import 'features/student/presentation/bloc/student_bloc.dart';
import 'features/teacher/presentation/bloc/teacher_bloc.dart';
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const GuruKoolXApp());
}


// Import repositories (assuming they exist or using dummy for now if dependency injection isn't set up)
// Since I don't see DI setup, I'll instantiate them directly or check if they need arguments.

class GuruKoolXApp extends StatelessWidget {
  const GuruKoolXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentBloc>(
          create: (context) => StudentBloc(), // Assuming default constructor or requires repo
        ),
         BlocProvider<TeacherBloc>(
          create: (context) => TeacherBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'GuruKoolX',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: RouteConstants.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

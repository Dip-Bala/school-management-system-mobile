import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(const LoadAllStudentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 24),
              _buildExploreServices(),
              const SizedBox(height: 24),
              _buildSectionHeader('Upcoming Events', showViewAll: true),
              const SizedBox(height: 12),
              _buildUpcomingCarousel(),
              const SizedBox(height: 24),
              _buildSectionHeader('Upcoming Lessons', showViewAll: true),
              const SizedBox(height: 12),
              _buildUpcomingCarousel(), // Reusing for demo, ideally different content
              const SizedBox(height: 24),
              _buildSectionHeader('Summary Report', showViewAll: true, viewAllText: 'Full Report'),
              const SizedBox(height: 12),
              _buildSummaryReport(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Logo placeholder or Asset
             Image.asset(
               'assets/images/logo.png',
               height: 30,
               errorBuilder: (c, o, s) => const Text(
                'GuruKoolX',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
             ),
             const SizedBox(width: 8),
             // Optional Text if Logo is icon only
            //  const Text(
            //   'GuruKoolX',
            //   style: TextStyle(
            //     fontSize: 22,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.primaryBlue,
            //   ),
            // ),
          ],
        ),
        Stack(
          children: [
            const Icon(Icons.notifications_outlined, size: 28, color: AppColors.textPrimary),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.mic_none, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildExploreServices() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore Services',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5, // Wider cards
            children: [
              _buildServiceCard('Attendance &\nPerformance', Icons.person_search_outlined),
              _buildServiceCard('Assignments &\nStudy Materials', Icons.edit_note_outlined),
              _buildServiceCard('Announcements &\nComm. Hub', Icons.mark_email_unread_outlined),
              _buildServiceCard('Reports &\nInsights', Icons.insert_chart_outlined),
              _buildServiceCard("Today's Schedule\n& Events", Icons.calendar_month_outlined),
              _buildServiceCard('Fees & Payment\nStatus', Icons.receipt_long_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF), // Light purple/blue background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryDark, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showViewAll = false, String viewAllText = 'View All'}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (showViewAll)
          Text(
            viewAllText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  Widget _buildUpcomingCarousel() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
           // Placeholder for carousel content
           const Center(child: Text('Carousel Content')),
           Positioned(
             bottom: 12,
             right: 16,
             child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white.withOpacity(0.5)
               ),
               child: const Text('View More', style: TextStyle(fontSize: 10)),
             ),
           ),
           // Dots indicator
           Positioned(
             bottom: 16,
             left: 0,
             right: 0,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 _buildDot(true),
                 _buildDot(false),
                 _buildDot(false),
                 _buildDot(false),
               ],
             ),
           )
        ],
      ),
    );
  }
  
  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 6 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.black87 : Colors.grey.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSummaryReport() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Attendance Chart
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const Text('Attendance', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const CircularProgressIndicator(
                        value: 0.81,
                        strokeWidth: 8,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryLight),
                      ),
                      Center(
                        child: Text(
                          '81%',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Grades Chart
          Expanded(
            flex: 6,
            child: Column(
              children: [
                const Text('Grades', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                // Simple Bar Chart
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBar(0.2, '1'),
                      _buildBar(0.4, '2'),
                      _buildBar(0.6, '3'),
                      _buildBar(0.8, '4'),
                      _buildBar(0.5, '5'),
                      _buildBar(0.7, '6'),
                    ],
                  ),
                ),
                 const SizedBox(height: 4),
                 const Text('Grades', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 8,
          height: 80 * heightFactor,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.feed_outlined), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'My Account'),
      ],
    );
  }
}

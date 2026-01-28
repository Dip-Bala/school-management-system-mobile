class OnboardingModel {
  final String title;
  final String description;
  final String illustration;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.illustration,
  });

  static List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: 'Welcome to GuruKoolX',
        description:
            'Manage your school efficiently with our smart and intuitive platform for teachers and students.',
        illustration: '📚',
      ),
      OnboardingModel(
        title: 'Smart Student & Teacher Management',
        description:
            'Easily handle student records, teacher schedules, and attendance tracking all in one place.',
        illustration: '👨‍🏫',
      ),
      OnboardingModel(
        title: 'Exams, Fees & Performance Tracking',
        description:
            'Manage exams, track payments, and generate performance reports effortlessly.',
        illustration: '📊',
      ),
      OnboardingModel(
        title: 'Stay Connected with AI Chat & Smart Notifications',
        description:
            'Get instant updates, send notifications to chat with students and parents efficiently.',
        illustration: '💬',
      ),
    ];
  }
}

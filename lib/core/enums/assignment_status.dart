enum AssignmentStatus {
  pending,
  submitted,
  graded,
  late;

  String get displayName {
    switch (this) {
      case AssignmentStatus.pending:
        return 'Pending';
      case AssignmentStatus.submitted:
        return 'Submitted';
      case AssignmentStatus.graded:
        return 'Graded';
      case AssignmentStatus.late:
        return 'Late';
    }
  }
}

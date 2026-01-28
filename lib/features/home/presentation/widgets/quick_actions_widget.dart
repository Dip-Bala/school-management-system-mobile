import 'package:flutter/material.dart';

class QuickActionsWidget extends StatelessWidget {
  final List<QuickAction> actions;

  const QuickActionsWidget({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: actions.map((action) => _buildActionChip(action)).toList(),
        ),
      ],
    );
  }

  Widget _buildActionChip(QuickAction action) {
    return ActionChip(
      avatar: Icon(action.icon, size: 18),
      label: Text(action.label),
      onPressed: action.onPressed,
    );
  }
}

class QuickAction {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const QuickAction({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
}

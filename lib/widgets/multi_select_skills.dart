import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectSkills extends StatefulWidget {
  final Map<String, Map<String, List<String>>> jobCategories;
  final String category;
  final String subCategory;
  final Function(List<String?>) onSelectionChanged;
  const MultiSelectSkills(
      {super.key,
      required this.category,
      required this.subCategory,
      required this.onSelectionChanged,
      required this.jobCategories});

  @override
  State<MultiSelectSkills> createState() => _MultiSelectSkillsState();
}

class _MultiSelectSkillsState extends State<MultiSelectSkills> {
  List<String?> _selectedSkills = [];
  void _showMultiSelect(BuildContext context) async {
    
  }
  @override
  Widget build(BuildContext context) {
    final skills =
        widget.jobCategories[widget.category]?[widget.subCategory] ?? [];
        
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Select skills you want',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              MultiSelectDialogField<String>(
                items:
                    skills.map((skill) => MultiSelectItem(skill, skill)).toList(),
                onConfirm: (values) {
                  setState(() {
                    _selectedSkills = values;
                    widget.onSelectionChanged(_selectedSkills);
                  });
                },
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              
        ],
      ),
    );
  }
}

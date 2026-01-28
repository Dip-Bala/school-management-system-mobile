import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/student_model.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/custom_button.dart';

class AddEditStudentScreen extends StatefulWidget {
  final StudentModel? student;

  const AddEditStudentScreen({
    super.key,
    this.student,
  });

  @override
  State<AddEditStudentScreen> createState() => _AddEditStudentScreenState();
}

class _AddEditStudentScreenState extends State<AddEditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _rollNumberController;
  late TextEditingController _addressController;
  late TextEditingController _parentNameController;
  late TextEditingController _parentPhoneController;
  late TextEditingController _parentEmailController;

  String _selectedGender = 'Male';
  String _selectedBloodGroup = 'A+';
  String _selectedClass = 'Class 1';
  String _selectedSection = 'A';
  DateTime? _dateOfBirth;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.student?.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.student?.lastName ?? '');
    _emailController = TextEditingController(text: widget.student?.email ?? '');
    _phoneController = TextEditingController(text: widget.student?.phone ?? '');
    _rollNumberController = TextEditingController(text: widget.student?.rollNumber ?? '');
    _addressController = TextEditingController(text: widget.student?.address ?? '');
    _parentNameController = TextEditingController(text: widget.student?.parentName ?? '');
    _parentPhoneController = TextEditingController(text: widget.student?.parentPhone ?? '');
    _parentEmailController = TextEditingController(text: widget.student?.parentEmail ?? '');
    
    if (widget.student != null) {
      _selectedGender = widget.student!.gender;
      _selectedBloodGroup = widget.student!.bloodGroup;
      _dateOfBirth = widget.student!.dateOfBirth;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _rollNumberController.dispose();
    _addressController.dispose();
    _parentNameController.dispose();
    _parentPhoneController.dispose();
    _parentEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.student != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Student' : 'Add Student'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Basic Information Section
            const Text(
              'Basic Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _firstNameController,
              labelText: 'First Name',
              hintText: 'Enter first name',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _lastNameController,
              labelText: 'Last Name',
              hintText: 'Enter last name',
              prefixIcon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Enter email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                // Add email validation
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _phoneController,
              labelText: 'Phone',
              hintText: 'Enter phone number',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _rollNumberController,
              labelText: 'Roll Number',
              hintText: 'Enter roll number',
              prefixIcon: Icons.numbers,
            ),
            const SizedBox(height: 24),

            // Academic Information
            const Text(
              'Academic Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Class and Section dropdowns would go here
            CustomTextField(
              controller: _addressController,
              labelText: 'Address',
              hintText: 'Enter address',
              prefixIcon: Icons.location_on,
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Parent Information
            const Text(
              'Parent Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _parentNameController,
              labelText: 'Parent Name',
              hintText: 'Enter parent name',
              prefixIcon: Icons.family_restroom,
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _parentPhoneController,
              labelText: 'Parent Phone',
              hintText: 'Enter parent phone',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              controller: _parentEmailController,
              labelText: 'Parent Email',
              hintText: 'Enter parent email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),

            // Submit Button
            CustomButton(
              text: isEdit ? 'Update Student' : 'Add Student',
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Create StudentModel and dispatch event
      final student = StudentModel(
        id: widget.student?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        rollNumber: _rollNumberController.text,
        classId: _selectedClass,
        section: _selectedSection,
        dateOfBirth: _dateOfBirth ?? DateTime.now(),
        gender: _selectedGender,
        address: _addressController.text,
        parentName: _parentNameController.text,
        parentPhone: _parentPhoneController.text,
        parentEmail: _parentEmailController.text,
        bloodGroup: _selectedBloodGroup,
        enrollmentDate: DateTime.now(),
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.student == null) {
        context.read<StudentBloc>().add(CreateStudentEvent(student));
      } else {
        context.read<StudentBloc>().add(UpdateStudentEvent(student));
      }

      Navigator.pop(context);
    }
  }
}

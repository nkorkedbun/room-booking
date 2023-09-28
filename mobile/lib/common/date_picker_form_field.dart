import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerFormField extends StatefulWidget {
  final void Function(DateTime selectedDate) onDateSelected;
  const DatePickerFormField({required this.onDateSelected, super.key});
  @override
  State<DatePickerFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  final DateTime firstDate = DateTime.now();
  DateTime? selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: firstDate.add(const Duration(days: 365)),
    ))!;
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = dateFormat.format(selectedDate!);
      });
      widget.onDateSelected(selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: dateController,
          decoration: const InputDecoration(
            labelText: 'Select Date',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
}

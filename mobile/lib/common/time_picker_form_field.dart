import 'package:flutter/material.dart';

class TimePickerFormField extends StatefulWidget {
  final void Function(TimeOfDay selectedTime) onTimeSelected;
  const TimePickerFormField({required this.onTimeSelected, super.key});

  @override
  State<TimePickerFormField> createState() => _TimePickerFormFieldState();
}

class _TimePickerFormFieldState extends State<TimePickerFormField> {
  TimeOfDay? selectedTime;
  TextEditingController timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text =
            "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}";
      });
      widget.onTimeSelected(selectedTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectTime(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: timeController,
          decoration: const InputDecoration(
            labelText: 'Select Time',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }
}

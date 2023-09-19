import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String name;
  final int capacity;
  const RoomCard({super.key, required this.name, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(),
      ),
      width: MediaQuery.of(context).size.width,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Text('Room $name'),
          const Spacer(),
          Text('$capacity Guest Max')
        ],
      ),
    );
  }
}

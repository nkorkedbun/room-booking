class Room {
  final int? id;
  final String? name;
  final int? capacity;

  Room({
    this.id,
    this.name,
    this.capacity,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['roomId'],
      name: json['roomName'],
      capacity: json['maxCapacity'],
    );
  }
}

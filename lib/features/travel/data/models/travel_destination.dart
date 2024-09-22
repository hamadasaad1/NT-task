import 'package:hive/hive.dart';

part 'travel_destination.g.dart'; // Generated file will be created

@HiveType(
  typeId: 3,
)
class TravelDestination {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final String createdBy;

  @HiveField(5)
  final Permissions permissions;

  TravelDestination({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.createdBy,
    required this.permissions,
  });

  factory TravelDestination.fromJson(Map<String, dynamic> json) {
    return TravelDestination(
      id: json['id'] ?? '',
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      createdBy: json['createdBy'],
      permissions: Permissions.fromJson(json['permissions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'createdBy': createdBy,
      'permissions': permissions.toJson(),
    };
  }
}

@HiveType(typeId: 4)
class Permissions extends HiveObject {
  @HiveField(0)
  final bool read;

  @HiveField(1)
  final bool write;

  @HiveField(2)
  final bool deleteItem;

  Permissions({
    required this.read,
    required this.write,
    required this.deleteItem,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      read: json['read'],
      write: json['write'],
      deleteItem: json['delete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'read': read,
      'write': write,
      'delete': deleteItem,
    };
  }
}

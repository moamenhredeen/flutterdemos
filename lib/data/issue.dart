import 'package:demos/data/issue_status.dart';

class Issue {
  int id;
  String name;
  String description;
  IssueStatus status;

  Issue({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  Issue copyWith({String? name, String? description, IssueStatus? status}) =>
      Issue(
        id: id,
        name: name ?? this.name,
        description: description ?? this.description,
        status: status ?? this.status,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Issue && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

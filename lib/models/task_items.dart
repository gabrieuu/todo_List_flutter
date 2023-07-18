class TaskItems {
  final int? id;
  final String title;
  final String description;
  final String importance;
  final bool? complete;


  const TaskItems({
    this.id,
    required this.title,
    required this.description,
    required this.importance,
    this.complete
  });
  
}
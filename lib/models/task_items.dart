class TaskItems {
  int? id;
  String title;
  String description;
  String importance;
  bool complete;


  TaskItems({
    this.id,
    required this.title,
    required this.description,
    required this.importance,
    this.complete = false
  });
  
  void setId(int id){
    this.id = id;
  }

  int? getId(){
    return id;
  }

  void setTitle(String title){
    this.title = title;
  }
  
  String getTitle(){
    return title;
  }

  void setDescription(String description){
    this.description = description;
  }
  String getDescription(){
    return description;
  }

  void setImportance(String importance){
    this.importance = importance;
  }
  String getImportance(){
    return importance;
  }

  void completar(){
    complete = !complete;
  }

}
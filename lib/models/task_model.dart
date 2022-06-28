class TaskModel{
  String? title;
  String? note;
  bool? done;

  TaskModel({required this.title, required this.note, this.done = false});

  Map<String, dynamic> toJson(){
    return {
      'Title' : title,
      'Note' : note,
      'IsDone' : done
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json){
    title = json['Title'];
    note = json['Note'];
    done = json['IsDone'];
  }
}
class ModelTodo {
  late String id;
  late String todoText;
  late bool isDone;

  ModelTodo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ModelTodo> todoList() {
    return [
      ModelTodo(id: '01', todoText: 'Morninig', isDone: true),
      ModelTodo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ModelTodo(id: '03', todoText: 'Check Emails'),
      ModelTodo(id: '04', todoText: 'Team Meeting'),
      ModelTodo(id: '05', todoText: 'Work on Mob App'),
      ModelTodo(id: '06', todoText: 'Dinner'),
    ];
  }
}

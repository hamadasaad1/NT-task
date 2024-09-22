class InputGetQuestion {
  String? name;
  Status? status;
  InputGetQuestion({
    this.name,
    this.status,
  });
}

enum Status { hard, easy, medium }

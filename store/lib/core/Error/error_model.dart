class ErrorModel {
  final bool status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromjson(json) {
    return ErrorModel(
      status: json["status"],
      errorMessage: json["message"],
    );
  }
}

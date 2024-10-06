import 'package:shop_ease/app/services/response/status.dart';

class ApiResponse<T>{
  String? message;
  T? data;
  Status? status;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading(): status = Status.loading;
  ApiResponse.failed(this.message): status = Status.failed;
  ApiResponse.completed(this.data): status = Status.completed;

  @override
  String toString(){
    return "Message: $message, Status: $status, Data: $data";
  }
}
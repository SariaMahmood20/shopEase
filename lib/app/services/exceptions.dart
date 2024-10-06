
class Exceptions implements Exception{
  String? message;
  String? prefix;

  Exceptions(this.message, this.prefix);

  @override
  String toString(){
    return "$message";
  }
}

class FetchDataException extends Exceptions{
  FetchDataException([String? message]): super(message, "Error while communicating with the server");
}

class FetchBadRequestException extends Exceptions{
  FetchBadRequestException([String? message]): super(message, "Bad Request Exception");
}

class FetchInvalidInputException extends Exceptions{
  FetchInvalidInputException([String? message]): super(message, "Invalid Input Exception");
}

class FetchUnauthorisedAcessException extends Exceptions{
  FetchUnauthorisedAcessException([String? message]): super(message, "Unauthorised Access Exception");
}
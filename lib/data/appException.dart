
class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message, String? prefix]) : super(message,prefix ?? 'Error During Communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message, String? prefix]) : super(message,prefix ?? 'Invalid request');
}

class UnauthorizedException extends AppException{
  UnauthorizedException([String? message, String? prefix]) : super(message,prefix ?? 'Unauthorized Exceptioon');
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message, String? prefix]) : super(message,prefix ?? 'Invalid Input Exceptioon');
}
 

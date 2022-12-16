import 'dart:convert';

class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix = ""]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message);
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ClientException extends ApiException {
  ClientException([String? message]) : super(message);
}

class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message);
}

class ServerException extends ApiException {
  // ServerException([String message]) : super(message);
  ServerException([String? message]) : super("Terjadi Kesalahan [500]");
}

class NetworkException extends ApiException {
  NetworkException([String message = "Tidak ada koneksi internet"])
      : super(message);
}

class GeneralException extends ApiException {
  GeneralException([String? message]) : super(message);
}

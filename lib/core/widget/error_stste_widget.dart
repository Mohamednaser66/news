import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/core/result.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key,this.serverError,this.exception});
final Exception? exception;
 final ServerError? serverError;
  @override
  Widget build(BuildContext context) {
    return Text(extractErrorMessage());
  }

  String extractErrorMessage(){
    String message='Error';

    if(serverError!=null){
     message=  serverError!.message;

    }else {
      if (exception is SocketException) {
        message = "No Internet Connection";
      }else if(exception is HttpException){
        message ="Could not Find The Post";
      }else if(exception is FormatException){
        message ='Bad Response Format';
      }
      return message;
    }
    return message;
  }
}


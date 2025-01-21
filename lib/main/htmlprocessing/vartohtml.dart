import 'dart:convert';

import 'styleprocessing.dart';

String varToHtml(dynamic input, bool isFirst) {
  String output = '';
  print("input $input");
  //The function for processing variables to HTML.

  if(input is List){

    

    String middle = '';

    if(isFirst){

      //isFirst is always false for the nested functions...

      for(dynamic i in input){

        //Make an unordered list of every item h

        middle += "<li>${varToHtml(i, false)}</li>";
        
      
      } 

      output = "<ul>$middle</ul>";

    } else {

      
      
      for(dynamic i in input){
        middle += "${varToHtml(i, false)}";
      }

      output = middle;
    }


  } else if (input is Map){


    if(input.containsKey('type')){

      switch(input['type']){

        //These are just some weird outliars you can ignore them

        case "structured-content":

          output = varToHtml(input["content"], false);

        case "text":

          output = varToHtml(input["text"], false);
      }

    } else if (input.containsKey('tag')){

      String start = "${input["tag"]}";

      if(input.containsKey("style")){
        start += " " + getStyles(input["style"]);
      }

      //This function is basically for html tags stored as JSON

      if(input.containsKey('content')){

        //If it has content than its probably one of the html tags like <this></this>

        output = "<$start>${varToHtml(input['content'], false)}</${input['tag']}>";

      } else {

        //then its probably one of the tags like <this>
      }


    }

  }

  if(output.isEmpty) output =  "<span>${input.toString()}</span>";

  print('I translated ${jsonEncode(input)} to $output');

  return output;

  
}

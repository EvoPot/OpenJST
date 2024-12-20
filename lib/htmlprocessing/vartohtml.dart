import 'styleprocessing.dart';

String varToHtml(dynamic input) {
  //The function for processing variables to HTML.

  if (input is Map) {
    //Processing for maps. waow
    //The following are the values from the json dictionaries:

    String tag = input["tag"] ?? "";
    String description = input["description"] ?? "";
    String width = input["width"].toString();
    String height = input["height"].toString();
    String sizeUnits = input["sizeUnits"] ?? "";
    String imageRendering = input["imageRendering"] ?? "";

    String styles = getStyles(input["style"]); //Initialize CSS styles.

    String innerValue = "${input["style"]?["listStyleType"] ?? ""}" +
        varToHtml(input["content"]).replaceAll("\n",
            "<br>"); // The inner value. <example>(its this one)</example> The HTML widget doesnt seem to support list-style-types unfortunately so we add the item beforehand

    if (["ruby", "rp", "rt"].contains(input["tag"])) {
      return """<$tag>$innerValue</$tag>"""; // Output a styleless html element for rubies (the hiragana stuff) - Is likely temporary!
    }

    if (input["tag"] == "img" || input["type"] == "image") {
      return """<${input["tag"] ?? "img"} src="asset:assets/images/favicon.png" 
                alt=$description
                width = $width$sizeUnits
                height = $height$sizeUnits
                image-rendering:$imageRendering
                ${input["pixelated"] == true ? "image-rendering:pixelated" : ""}>"""; //The dictionary format has "pixelated" and "imageRendering" attributes seperately, this is for fallback
    } else {
      String colSpanAttr = input["colSpan"] != null
          ? 'colspan="${input["colSpan"]}"'
          : ''; //For the tables
      String rowSpanAttr = input["rowSpan"] != null
          ? 'rowspan="${input["rowSpan"]}"'
          : ''; //Also for the tables

      return ("""
            <$tag
                style="$styles"
                  $colSpanAttr $rowSpanAttr>
                    $innerValue</$tag>

                """
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim()); //Return the final result
    }
  } else if (input is List) {
    String output = "";

    for (dynamic i in input) {
      output += varToHtml(i);
    } //Process every element of a List

    return output;
  } else {
    return input
        .toString(); //If the input is not a map or a list, just return the input as a string.
  }
}

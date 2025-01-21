String getStyles(Map input, {String tag = "div"}) {
  String output = 'style="';

  // Applying styles to the outer element (div or any tag)
  thisTranslatesToThat("fontStyle", "font-style", output, input);
  thisTranslatesToThat("fontWeight", "font-weight", output, input);
  thisTranslatesToThat("textDecorationLine", "text-decoration-line", output, input);
  thisTranslatesToThat("verticalAlign", "vertical-align", output, input);
  thisTranslatesToThat("listStyleType", "list-style-type", output, input);
  thisTranslatesToThat("borderStyle", "border-style", output, input);
  thisTranslatesToThat("padding", "padding", output, input);
  thisTranslatesToThat("borderRadius", "border-radius", output, input);
  thisTranslatesToThat("borderWidth", "border-width", output, input);
  thisTranslatesToThat("marginTop", "margin-top", output, input);
  thisTranslatesToThat("marginBottom", "margin-bottom", output, input);
  thisTranslatesToThat("borderColor", "border-color", output, input);
  thisTranslatesToThat("backgroundColor", "background-color", output, input);
  thisTranslatesToThat("fontSize", "font-size", output, input);
  thisTranslatesToThat("color", "color", output, input);

  return output + '"';
}

String getTag(Map input, {String tag = "div"}) {
  String style = getStyles(input, tag: tag);
  
  // For tags like 'span' inside 'div', ensure they also get individual styling.
  if (tag == "span" && input.containsKey("color")) {
    style = 'style="color:${input["color"]};"';
  }
  
  return "<$tag $style>${input['content']}</$tag>";
}

void thisTranslatesToThat(String This, String That, String processedVar, Map wereChecking) {
  if (wereChecking.containsKey(This)) {
    if (wereChecking[This] is List) {
      processedVar += "$That:${wereChecking[This].join(" ")};";
    } else {
      processedVar += "$That:${wereChecking[This]};";
    }
  }
}

String getStyles(dynamic input) {
  List<String> styles = [
    "text-decoration-line: ${input?["textDecorationLine"] is List ? (input["textDecorationLine"] as List).join(" ") : input?["textDecorationLine"] ?? "none"};",
    "font-style: ${input?["fontStyle"] ?? "normal"};",
    "font-weight: ${input?["fontWeight"] ?? "normal"};",
    "font-size: ${(input?["fontSize"] == "xxx-large") ? "32px" : input?["fontSize"] ?? "16px"};",
    "vertical-align: ${input?["verticalAlign"] ?? "baseline"};",
    "text-align: ${input?["textAlign"]?.toString() ?? "left"};",
    "list-style-type: ${input?["listStyleType"] != null ? "none" : ""};"
  ];

  String output = styles.join("");

  print(output);
  return output;
}

import 'styleattribute.dart';

class OJSTElement {
  final String tag;
  List<OJSTElement> children = [];
  final bool hasChildren;
  StyleAttribute? style;

  OJSTElement(this.tag, this.hasChildren);

  String convertToString() {

    String styles = convertStylesToString();

    String attributes = getAttributes();
    
    if (hasChildren) {
      String inside = convertChildrenToString();
      return "<$tag$attributes$styles>$inside</$tag>";
    } else {
      return "<$tag$attributes$styles>";
    }
  }

  String convertChildrenToString() {
    String output = '';

    if (children.length == 0) {
      return '';
    }

    for (OJSTElement child in children) {
      output += child.convertToString();
    }

    return output;
  }

  String getAttributes(){
    return '';
  }

  String convertStylesToString(){
    List<String> styles = [];

    if(style != null){

      if(style!.fontStyle != null) styles.add('font-style: ${style!.fontStyle};');
      if(style!.fontWeight != null) styles.add('font-weight: ${style!.fontWeight};');
      if(style!.fontSize != null) styles.add('font-size: ${style!.fontSize};');
      if(style!.color != null) styles.add('color: ${style!.color};');
      if(style!.background != null) styles.add('background: ${style!.background};');
      if(style!.backgroundColor != null) styles.add('background-color: ${style!.backgroundColor};');
      if(style!.textDecorationLine != null) styles.add('text-decoration-line: ${style!.textDecorationLine};');
      if(style!.textDecorationStyle != null) styles.add('text-decoration-style: ${style!.textDecorationStyle};');
      if(style!.textDecorationColor != null) styles.add('text-decoration-color: ${style!.textDecorationColor};');
      if(style!.borderColor != null) styles.add('border-color: ${style!.borderColor};');
      if(style!.borderStyle != null) styles.add('border-style: ${style!.borderStyle};');
      if(style!.borderRadius != null) styles.add('border-radius: ${style!.borderRadius};');
      if(style!.borderWidth != null) styles.add('border-width: ${style!.borderWidth};');
      if(style!.clipPath != null) styles.add('clip-path: ${style!.clipPath};');
      if(style!.verticalAlign != null) styles.add('vertical-align: ${style!.verticalAlign};');
      if(style!.textAlign != null) styles.add('text-align: ${style!.textAlign};');
      if(style!.textEmphasis != null) styles.add('text-emphasis: ${style!.textEmphasis};');
      if(style!.textShadow != null) styles.add('text-shadow: ${style!.textShadow};');
      if(style!.margin != null) styles.add('margin: ${style!.margin};');
      if(style!.marginTop != null) styles.add('margin-top: ${style!.marginTop};');
      if(style!.marginLeft != null) styles.add('margin-left: ${style!.marginLeft};');
      if(style!.marginRight != null) styles.add('margin-right: ${style!.marginRight};');
      if(style!.marginBottom != null) styles.add('margin-bottom: ${style!.marginBottom};');
      if(style!.padding != null) styles.add('padding: ${style!.padding};');
      if(style!.paddingTop != null) styles.add('padding-top: ${style!.paddingTop};');
      if(style!.paddingLeft != null) styles.add('padding-left: ${style!.paddingLeft};');
      if(style!.paddingRight != null) styles.add('padding-right: ${style!.paddingRight};');
      if(style!.paddingBottom != null) styles.add('padding-bottom: ${style!.paddingBottom};');
      if(style!.wordBreak != null) styles.add('word-break: ${style!.wordBreak};');
      if(style!.whiteSpace != null) styles.add('white-space: ${style!.whiteSpace};');
      if(style!.cursor != null) styles.add('cursor: ${style!.cursor};');
      if(style!.listStyleType != null) styles.add('list-style-type: ${style!.listStyleType};');



    }

    if(styles.isEmpty) return '';

    return ' style="${styles.join(' ')}"';



  }
}

class LinkElement extends OJSTElement {
  final String href;
  final String? lang;
  LinkElement(
    {
      required this.href,
      required this.lang
    }
  ) : super('a',false);

  @override
  String getAttributes(){

    String output = '';

    output += ' href="$href"';

    if(lang != null){
      output += ' lang="$lang"';
    }

    return output;



  }
}
